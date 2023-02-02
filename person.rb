require './nameable'

class Person < Nameable
  # Attribute accessor setters and getters
  attr_reader :id
  attr_accessor :name, :age

  # Constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # public method

  def correct_name
    @name
  end

  def can_use_services?
    return true if @age || @parent_permission
  end

  # private method

  private

  def of_age?
    return true if @age >= 18
  end
end
