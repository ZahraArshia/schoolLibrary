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

  describe 'test if they correctly push in a new instance of the Rental object' do
    it 'Should return only one rental when adding a rental to a teacher and a book' do
      sample_book = Book.new 'computer architecture', 'morris mano'
      sample_person = Teacher.new 26, 'computer', 'Mr. Green'
      sample_rental = Rental.new '2022-02-02', sample_book, sample_person
      expect(sample_person.rentals.length).to eq 1
      expect(sample_book.rentals.length).to eq 1
      expect(sample_person.rentals).to eql [sample_rental]
    end

    it 'check if rental book is pushed into rentals correnctly' do
      sample_book = Book.new 'computer architecture', 'morris mano'
      sample_person = Teacher.new 26, 'computer', 'Mr. Green'
      sample_rental = Rental.new '2022-02-02', sample_book, sample_person
      expect(sample_person.rentals).to eql [sample_rental]
    end
  end
end
