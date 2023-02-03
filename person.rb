require './nameable'
require_relative './decorator'
require_relative './capitalize_decorator'
require_relative './trimmer_decorator'

class Person < Nameable
  # Attribute accessor setters and getters
  attr_accessor :id, :rentals, :book, :name, :age, :parent_permission

  # Constructor
  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  # public method

  def correct_name
    @name
  end

  def add_rental(person, date)
    Rental.new(date, self, person)
  end

  def can_use_services?
    return true if @age || @parent_permission
  end

  def self.create_person
    print 'Create a student (1) or a teacher (2)? [Enter the number]:'
    person_selected = gets.chomp
    if person_selected != '1' && person_selected != '2'
      puts 'Invalid option'
    else
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp

      case person_selected
      when '1'
        Student.create_student(age, name)
      when '2'
        Teacher.create_teacher(age, name)
      end
    end
  end

  def self.list_all_people(people)
    if people.empty?
      'No people found, choose a different option to register a new person'
    else
      people.each do |person|
        puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # private method

  private

  def of_age?
    return true if @age >= 18
  end
end
