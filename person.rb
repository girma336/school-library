require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  def self.counter
    @counter ||= 0
    @counter += 1
  end

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = self.class.counter
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
    @rentals = []
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

  def correct_name
    @name
  end

  def add_rental(rental)
    @rentals << rental
  end
end
