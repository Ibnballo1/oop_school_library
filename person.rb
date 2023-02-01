class Person
  # Attribute accessor setters and getters
  attr_accessor :id, :name, :age

  # Constructor
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # private method

  private

  def of_age?
    return true if @age >= 18
  end

  # public method

  def can_use_services?
    return true if @age || @parent_permission
  end
end
