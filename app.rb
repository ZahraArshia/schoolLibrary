require './books'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'
require './people'
require './rentingbooks'

class App
  def initialize
    @books = Books.new
    @people = Peoplemodule.new
    @rentals = RentingBooks.new(@books.books, @people.people)
  end

  def start
    selection
  end

end
