class Classroom
  attr_accessor :lable
  attr_reader :student

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_student(student)
    @students << student
    classroom.students = self
  end
end
