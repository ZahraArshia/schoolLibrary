require 'spec_helper'

describe Rental do
  before :each do
    @book = Book.new 'Title', 'Author'
    @person = Teacher.new 26, 'Specialization', 'Name'
    @rental = Rental.new 'Date', @book, @person
  end

  describe '#new' do
    it 'takes three parameters and returns a rental object' do
      @rental.should be_an_instance_of Rental
    end
  end

  describe '#date' do
    it 'returns the correct date' do
      @rental.date.should eql 'Date'
    end
  end

  describe '#person' do
    it 'returns the correct person' do
      @rental.person.age.should eql 26
      @rental.person.specialization.should eql 'Specialization'
      @rental.person.name.should eql 'Name'
    end
  end

  describe '#book' do
    it 'returns the correct book' do
      @rental.book.title.should eql 'Title'
      @rental.book.author.should eql 'Author'
    end
  end
end
