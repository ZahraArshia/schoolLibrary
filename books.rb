require './book'
require './data'
require 'json'

class Books
  attr_accessor :books

  def initialize
    # @books = []
    @books = read_books
  end

  def booklist
    puts 'No book found!' if @books.empty?
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'book title: '
    title = gets.chomp

    print 'book author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    write_books(@books)

    puts 'Book created successfully'
  end
end
