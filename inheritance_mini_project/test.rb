require_relative "employee"
require_relative "manager"

if __FILE__ == $PROGRAM_NAME
    david = Employee.new("David", "TA", 10000, "Darren")
    shawna = Employee.new("Shawna", "TA", 12000, "Darren")
    darren = Manager.new("Darren", "TA Manager", 78000, "Ned", [david, shawna])
    ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])
    p ned.bonus(5) # => 500_000
    p darren.bonus(4) # => 88_000
    p david.bonus(3) # => 30_000
end

