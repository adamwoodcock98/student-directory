@students = []

def update_student_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp # get the first name
  while !name.empty? do # while the name is not empty, repeat this code
    update_student_array(name, "november") # add the student hash to the array
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp # get another name from the user
  end
end 

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_file(file)
  if File.exists?(file) # if it exists
    load_students(file)
    puts "Loaded #{@students.count} students from #{file}"
  else # if it doesn't
    puts "Sorry, #{file} doesn't exist"
    exit #quit the program
  end
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = "students.csv"
  end
  try_load_file(filename)
end


def print_header
  puts "The students of Villain Academy"
  puts "------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def print_menu
  # 1. Print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  # show the students
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
  when "3"
    save_students
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
    process(STDIN.gets.chomp)
  end
end

#call the methods
try_load_students
interactive_menu