class Classroom
  def initialize(lable)
    @label = lable
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end
