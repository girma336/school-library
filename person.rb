class Person
  attr_accessor :name, :age
  attr_reader :id

  def self.counter
    @counter ||= 0
    @counter += 1
  end

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = self.class.counter
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  def of_age?
    return true if age >= 18

    false
  end

  public

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end
end

# # person = Person.new(6, 'Girma', parent_permission: false)
# # person2 = Person.new(89)
# # # person2 = Student.new("a")
# # puts person.id
# # puts person.instance_eval('is_of_age?')
# # puts person2.name
# puts person2.id
