class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author, :rentals

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def to_json(*_args)
    JSON.generate({class:  author: @author, title: @title })
  end

end
