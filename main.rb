require_relative './app'

puts 'Welcome to your school library'

def list_selections
  puts ''
  puts "Please choose an option by selecting a number:
              1. List all books
              2. List all people
              3. Create person account
              4. Create a book
              5. Create a rental
              6. List all rentals for a given person ID
              7. Exit"
  gets.chomp
end

def main
  app = App.new
  app.start
end

def selection
  case list_selections
  when '1'
    @books.booklist
  when '2'
    @people.peoplelist
  when '3'
    @people.create_person
  when '4'
    @books.create_book
  when '5'
    @rentals.create_rental
  when '6'
    @rentals.rentalslist
  when '7'
    puts 'Thank you for using the app. Goodbye!'
  else
    puts 'Invalid input. Try again'
  end
  selection
end

main



require './rental'
require './people'
require './books'

class RentingBooks
  attr_accessor :rentals, :people, :books

  def initialize(books, person)
    @rentals = []
    @books = books
    @people = person
  end

  def create_rental
    if @books.empty? && @people.empty?
      puts 'There are no Books or people Available'
    else
      puts 'select the book by number: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Book Title: \"#{book.title}\" | Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'select a person by number: '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter the date[yyyy-mm-dd]: '
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books[index], @people[selected_person])
      @rentals.push(rental_item)
      puts 'Rental created successfully'
    end
  end

  def rentalslist
    puts 'No rentals has been made at the moment' if @rentals.empty?
    print 'To view your rental records, type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rend| rend.person.id == id }
    if rental.empty?
      puts 'No records for that particular ID'
    else
      puts 'Your rental records are the following: '
      puts ''
      rental.each_with_index do |record, index|
        puts ''
        print "#{index + 1}| Date: #{record.date} | Borrower: #{record.person.name}"
        print " | Status: #{record.person.class} | Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
        puts ''
      end
    end
  end
end

def rentalslist
  puts 'inter person id'
  id = gets.chomp.to_i
  @rentals.each do |rental|
    if rental.person.id.to_i == id.to_i
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}"
    end
  end
end

