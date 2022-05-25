require 'spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Lable'
  end

  describe '#new' do
    it 'takes one parameters and returns a classroom object' do
      @classroom.should be_an_instance_of Classroom
    end
  end

  describe '#lable' do
    it 'returns the correct lable' do
      @classroom.label.should eql 'Lable'
    end
  end
end
