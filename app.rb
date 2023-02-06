require './book'
require './classroom'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def list_books
    puts 'Books: '
    @books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
    puts ''
  end

  def list_people
    puts 'People: '
    @people.each { |person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
    puts ''
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    print '[Input the number]: '
    person_type = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Age : '
    age = gets.chomp.to_i
    case person_type
    when 1
      print 'Has parent permission? [Y/N]: '
      permission = gets[0]
      permission = (permission == ('Y' || 'y'))
      @people << Student.new('Unknown', age, name, permission)
    when 2
      print 'Specialization: '
      specialization = gets.chomp
      @people << Teacher.new(specialization, age, name)
    end
    puts "Person created successfully \n\n"
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts "Book created successfully\n\n"
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    book_number = gets.chomp.to_i
    puts 'Select a Person from the following list by number (not ID)'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @people[person_number], @books[book_number])
    puts "Rental created successfully \n\n"
  end

  def list_rentals
    print 'ID of person: '
    person_id = gets.chomp
    puts 'Rentals: '
    @rentals.each do |rental|
      if rental.person.id.to_s == person_id.to_s
        puts "#{rental.class} #{rental.date} | Book: \"#{rental.book.title}\" rented by #{rental.person.name}"
      else
        puts 'wrong ID'
      end
    end
    puts ''
  end
end
