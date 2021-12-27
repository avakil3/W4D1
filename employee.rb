require_relative "manager"

class Employee
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        unless self.boss.nil? 
            add_employee 
        end 
    end

    def find_bonus(multiplier)
            salary_sum = 0
            return self.salary * multiplier if !self.is_a?(Manager)
            self.employees.each do |employee|
                if employee.is_a?(Manager) 
                    salary_sum += employee.salary + employee.find_bonus(multiplier)
                else
                    salary_sum += employee.salary
                end
            end
            bonus = salary_sum * multiplier
            bonus
    end 

    def add_employee
        self.boss.employees << self
    end 

    def inspect  
        name
    end 

    # private 
    attr_accessor :bonus
    attr_reader :salary, :title, :boss, :name
end

# if boss == TA_manager
#     @TAmanager[elployees] << empployee