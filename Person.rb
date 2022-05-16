class Person
  def initialize( name = "Unknown", age, parent_permission: true ) 
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  # accessor get method
  attr_reader :id

  # accessor get and set method
  attr_accessor :name, :age

  # Public method
  def can_use_services?
    return true if is_of_age? || @parent_permission
    false
  end

  # private method
  private
  def is_of_age? 
    return true if age >= 18
    false
  end
  
end
