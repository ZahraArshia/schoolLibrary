require 'json'
require './student'
require './teacher'
require './rental'

# class Data
#   def initialize(datafile)
#     @datafile = datafile
#     @file = "data/#{@datafile}.json"
#     write([]) unless File.file?(@file)
#   end

#   def read
#     if File.exists?(@file)
#       data = File.read(@file)
#       JSON.parse(data)
#     else
#       File.open("data/#{@datafile}.json", 'w')
#       puts 'new source created'
#     end
#   end

#   def write(data)
#     if File.exists?(@file)
#       json = JSON.generate(data)
#       File.write(@file, json, mode: "a")
#     else
#       File.open("data/#{@datafile}.json", 'w')
#       puts 'new source created'
#     end
#   end
# end

# def create_file(name)
#   File.write("./data/#{name}.json", []) unless File.exist?("./data/#{name}.json")
# end

def initialize_files
  # create_file(book_file)
  # create_file(people_file)
  # create_file(rental_file)
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
  # books.each do |book|
  #   File.write('./data/book_file.json', book, mode: "a")
  # end
  temp = []
  books.each do |book|
    temp.push( {
      title: book.title,
      author: book.author
    })
  end

  File.write('./data/book_file.json', (JSON.generate(temp)).to_s)
end
