# define possible cohorts to prevent typos.
cohorts = [
  :january,
  :february,
  :march,
  :april,
  :may,
  :june,
  :july,
  :august,
  :september,
  :october,
  :november,
  :december
]

def input_students(cohorts)
  puts "Please enter the names of the students".center(100)
  puts "To finish, just hit return twice\n".center(100)
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the students cohort
    puts "Enter the students cohort".center(100)
    cohort = gets.chomp.downcase.to_sym
    while !cohorts.include?(cohort)
      puts "\nI'm sorry I don't recognise that cohort. Please ensure you are typing the full month, for example 'November' and try again\n".center(100)
      cohort = gets.chomp.downcase.to_sym
    end
    # add the students height
    puts "Enter the students height in CM".center(100)
    height = gets.chomp
    # add the students country of birth
    puts "Enter the students country of birth".center(100)
    birth_country = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, height: height, birth_country: birth_country}
    # show the student count
    puts students.count == 1 ? "Now we have #{students.count} student" : "Now we have #{students.count} students".center(100)
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
  puts "Overall, we have #{students.count} great students".center(100)
end

#call the methods
students = input_students(cohorts)
print_header
print(students)
print_footer(students)