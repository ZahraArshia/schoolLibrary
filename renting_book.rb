require './rental'
require './people'
require './books'

class Rentingbook
  attr_accessor :rentals, :people, :books
  def initialize(people, books)
    @rentals = []
    @people = person
    @books = books
  end

  def create_rental
    if @books.size.zero?
      puts 'No Books Available'
    elsif @people.size.zero?
      puts 'No Person Available'
    else
      puts 'select the book by number'
      @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
      selected_book = gets.chomp.to_i

      puts 'select a person by number'
      @people.each_with_index do |person, index|
        puts "#{index}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      selected_person = gets.chomp.to_i

      puts 'Enter date [YYYY-MM-DD]'
      date = gets.chomp.to_s

      rental_item = Rental.new(date, @books[selected_book], @people[selected_person])
      @rentals.push(rental_item)
      puts 'Rental created successfully'
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
end
