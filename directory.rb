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
  puts "Would you like to view the students by their respective cohorts?".center(100)
  choice = gets.chomp.downcase
  if choice == "yes" || "y"
    print_by_cohorts(students)
  else
    puts "--------------".center(100)
    puts "Thank you for using the student directory".center(100)
    puts "--------------".center(100)
  end
end

def print_by_cohorts(students)
  # create an empty hash
  grouped_students = {}
  # iterate through our students to store their na
  students.each { |student|
    if grouped_students[student[:cohort]] == nil
      grouped_students[student[:cohort]] = []
    end
    grouped_students[student[:cohort]].push(student[:name])
  }
  grouped_students.each { |key, value|
    puts key
    value.each { |i|
      puts i
    }
  }
end

#call the methods
students = input_students(cohorts)
print_header
print(students)
print_footer(students)