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

  describe '#add_student methode test' do
    it 'Should return two student' do
      lynette = Student.new(20, 'Lynette', parent_permission: true)
      zahra = Student.new(25, 'Zahra', parent_permission: false)
      @classroom.add_student(lynette)
      @classroom.add_student(zahra)
      expect(@classroom.students.length).to eql 2
    end

    it 'Should return the classroom of the student' do
      zahra = Student.new(25, 'Zahra', parent_permission: true)
      @classroom.add_student(zahra)
      expect(zahra.classroom).to eql @classroom
    end
  end
end
