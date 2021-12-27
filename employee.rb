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

    # def bonus(multiplier)
    #     # if self.boss.nil?
    # end 

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