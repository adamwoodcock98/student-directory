@students = []

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = gets.chomp
  end
end 

def print_header
  puts "The students of Villain Academy"
  puts "------------"
end

def print_students_list
  @students.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # 1. Print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  # show the students
  puts @students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  # 3. Do what the user has asked
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # the program will terminate
  else
    puts "I didn't quite catch that. Please try again."
  end
end

def interactive_menu
  loop do
    # 2. Read the input and save it into a variable
    print_menu
    process(gets.chomp)
  end
end

#call the methods
interactive_menu