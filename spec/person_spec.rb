require 'spec_helper'

describe Person do
  before :each do
    @person = Person.new 25, 'Name'
  end

  describe '#new' do
    it 'takes two parameters and returns a person object' do
      @person.should be_an_instance_of Person
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      @person.age.should eql 25
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @person.name.should eql 'Name'
    end
  end
end
