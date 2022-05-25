require 'spec_helper'

describe Student do
  before :each do
    @student = Student.new 10, 'Name'
  end

  describe '#new' do
    it 'takes two parameters and returns a student object' do
      @student.should be_an_instance_of Student
    end
  end

  describe '#name' do
    it 'returns the correct name' do
      @student.name.should eql 'Name'
    end
  end

  describe '#age' do
    it 'returns the correct age' do
      @student.age.should eql 10
    end
  end

  describe '#play hooky ?' do
    it 'if it plays hooky ¯\(ツ)/¯' do
      expect(@student.play_hooky).to eql("¯\(ツ)/¯")
    end
  end

  describe '#classroom' do
    it 'Should return the classroom of student when adding the classroom' do
      @classroom = Classroom.new 'Lable'
      @student.classroom = @classroom
      expect(@student.classroom).to eql @classroom
    end
  end
end
