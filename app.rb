require './student'
require './teacher'
require './rental'
require './book'
class App
  attr_accessor :books, :rentals, :person

  def initialize
    @books = []
    @rentals = []
    @person = []
  end

  def create_studnet
    print 'Class Room: '
    classroom = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    print 'Parent Permission [T/F]: '
    parent_permission = gets.chomp.capitalize
    case parent_permission
    when 'T'
      parent_permission = true
    when 'F'
      parent_permission = false
    else
      puts 'Invalid selection, please choose from Y or F'
      print 'Parent Permission [T/F]: '
      parent_permission = gets.chomp.capitalize
    end
    @person << Student.new(classroom, age, name, parent_permission: parent_permission)
    puts ['Person created succsefully', ' ']
  end

  def list_person
    @person.each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    puts ['No person on the list', ''] if @person.empty?
  end

  def add_teacher
    print 'Specializetion: '
    specialization = gets.chomp.capitalize
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp.capitalize
    @person << Teacher.new(specialization, age, name)
    puts ['Person created succsefully', ' ']
  end

  def create_book
    print 'Title : '
    title = gets.chomp.capitalize
    print 'Author : '
    author = gets.chomp.capitalize

    book = Book.new(title, author)
    @books << book
  end

  def list_book
    @books.each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
    puts ['No book on the list', ' '] if @books.empty?
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_number = gets.chomp.to_i
    book = @books[book_number]

    puts [' ', 'Select a person from the following list by number (not id']
    @person.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    person = @person[person_number]
    puts ''

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, book, person)
    puts ['Rental created successfully', ' ']
  end

  def list_rental_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    person = @person.find { |p| p.id == person_id }
    if person.nil?
      puts ["No person found with id #{person_id}", ' ']
      return
    end

    puts [' ', 'Rentals: ']

    rentals = @rentals.select { |r| r.person.id == person_id }
    if rentals.empty?
      puts ["No rentals found for person with id #{person_id}", ' ']
      return
    end

    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}"
    end
  end
end
