def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    
    # add the students height
    puts "Enter the students height in CM"
    height = gets.chomp
    # add the students country of birth
    puts "Enter the students country of birth"
    birth_country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, height: height, birth_country: birth_country}
    # show the student count
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end 

def print_header
  puts "The students of Villain Academy".center(100)
  puts "------------".center(100)
end

def print(students)
  students.each { |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort). Height - #{student[:height]}cm. Country of birth - #{student[:birth_country]}".center(100)
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#call the methods
students = input_students
print_header
print(students)
print_footer(students)