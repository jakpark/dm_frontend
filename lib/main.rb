require 'csv'

class Main
  def parse(filepath, separator = ", ")
    arr = []
      
    lines = CSV.foreach(filepath, col_sep: "#{separator}") do |line|
      arr.push(line)
    end
    
    print arr
    puts
  end
  
  
end

m = Main.new

puts m.parse("./input/1.csv", " ")
puts m.parse("./input/2.csv")
puts m.parse("./input/3.csv", " | ")