require 'spec_helper'
require './student'
require './capitalize_decorator'
require './trimmer_decorator'
require './decorator'

describe Nameable do
  before :each do
    person = Student.new(12, 'lynnzahraa')
    @name = Decorator.new(person)
    @capitalize = CapitalizeDecorator.new(@name)
    @trimmed = TrimmerDecorator.new(@name)
  end

  it 'returns the name' do
    expect(@name.correct_name).to eql('lynnzahraa')
  end
end
