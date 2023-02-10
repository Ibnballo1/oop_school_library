require 'spec_helper'

# Test for initialize method
describe Book do
  it 'should create instance of the book class with 2 parameters' do
    book = Book.new('Title', 'Author')
    expect(book).to be_an_instance_of Book
  end
end

# Test for title
describe '#title' do
  it 'should return the right title' do
    book = Book.new('My Title', 'My Author')
    expect(book.title).to eq('My Title')
  end
end

# Test for author
describe '#author' do
  it 'should return the right author' do
    book = Book.new('My Title', 'My Author')
    expect(book.author).to eq('My Author')
  end
end

# Test for add_rental
describe '#add_rental' do
  it 'should add a rental to the rentals array' do
    person1 = Person.new(18, 'Doe', 'Y')
    book = Book.new('My Title', 'My Author')
    date = Time.now

    book.add_rental(person1, date)

    expect(book.rentals.length).to eq(1)
  end
end
