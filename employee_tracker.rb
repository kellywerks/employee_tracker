require 'active_record'
require './lib/employee'
require './lib/division'


database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)


def main
  puts "Hello!"
  choice = nil
  until choice == 'e'
    puts "\nADD OPTIONS:"
    puts "1.  Add a new employee."
    puts "2.  Add a new division."
    puts "LIST OPTIONS:"
    puts "3.  List all employees."
    puts "4.  List all divisions."
    puts "5.  List all employees by division."
    puts "Choose an option or select 'e' to exit.\n"
    choice = gets.chomp

    case choice
    when "1"
      add_employee
    when "2"
      add_division
    when "3"
      list_employees
    when "4"
      list_divisions
    when "5"
      list_employees_by_division
    when 'e'
      puts "Good-bye!"
    else
      puts "Invalid selection.  Please choose again."
    end
  end
end


def add_division
  puts "What is the name of the new division?"
  division_name = gets.chomp
  new_division = Division.new({:name => division_name})
  new_division.save
  puts "'#{division_name}' has been added."
end

def list_divisions
  all_divisions = Division.all
  all_divisions.each_with_index { |division, index| puts "#{index +1}. #{division.name}"}
  main
end



def add_employee

end

def list_employees
  all_employees = Employee.all
  all_employees.each_with_index { |employee, index| puts "#{index +1}. #{employee.name}"}
  main
end


main
