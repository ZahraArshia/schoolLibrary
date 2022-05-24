require 'json'
require './student'
require './teacher'
require './rental'

def initialize_files
  File.write('./data/book_file.json', []) unless File.exist?('./data/book_file.json')
  File.write('./data/people_file.json', []) unless File.exist?('./data/people_file.json')
  File.write('./data/rental_file.json', []) unless File.exist?('./data/rental_file.json')
end

def read_books
  books = []
  (JSON.parse(File.read('./data/book_file.json'))).each do |book|
    books.push(Book.new(book['title'], book['author']))
  end
  books
end

def write_books(books)
  temp = []
  books.each do |book|
    temp.push({
                title: book.title,
                author: book.author
              })
  end

  File.write('./data/book_file.json', (JSON.generate(temp)).to_s)
end

def write_people(persons)
  temp = []
  persons.each do |person|
    temp << if person.instance_of? Student
              {
                role: 'Student',
                name: person.name,
                age: person.age,
                parent_permission: person.parent_permission
              }
            elsif person.instance_of? Teacher
              {
                role: 'Teacher',
                name: person.name,
                age: person.age,
                specialization: person.specialization
              }
            end
  end

  File.write('./data/people_file.json', (JSON.generate(temp)).to_s)
end

def read_people
  people = []
  (JSON.parse(File.read('./data/people_file.json'))).each do |person|
    people << case person['role']
              when 'Student'
                Student.new(person['age'], person['name'], parent_permission: person['parent_permission'])
              when 'Teacher'
                Teacher.new(person['age'], person['specialization'], person['name'])
              end
  end
  people
end

# def write_rental(rentals)
#   temp = []
#   rentals.each do |rental|
#     temp.push({
#       date: rental.date,
#       id: rental.id,
#       borrower: rental.name,
#       book: rental.title,
#       author: rental.author
#     })
#   end
#     File.write('./data/rental_file.json', JSON.generate(temp))
#   end

#   # File.write('./data/rental_file.json', JSON.generate(rentals))
# end

# def read_rentals
#   books = read_books
#   persons = read_people
#   rentals = []
#   (JSON.parse(File.read('./data/rental_file.json'))).each do |rental|
#     rentals << Rental.new(rental['date'],
#       books.select { |book| book.title == rental['title'] } [0],
#       persons.select { |person| person.id == rental['id'] } [0])
#   end
#   rentals
# end
