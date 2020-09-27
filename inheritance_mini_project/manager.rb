require_relative "employee"

class Manager < Employee

    attr_reader :employees

    def initialize(name, title, salary, boss, underlinings)
        super(name, title, salary, boss)
        @employees = underlinings
    end

    def bonus(multiplier)
        total_salaries = 0
        @employees.each do |e|
            if e.is_a?(Manager)
                total_salaries += e.bonus(1)
            end
            total_salaries += e.salary
        end
        total_salaries * multiplier
    end
end