require 'csv'

class Main
  def parse(filepath, separator = "comma")
    case 
    when separator == "space"
      delimiter = " "
    when separator == "comma"
      delimiter = ", "
    when separator == "pipe"
      delimiter = " | "
    end
    
    arr = []
      
    lines = CSV.foreach(filepath, col_sep: delimiter) do |line|
      arr.push(line)
    end
    
    print arr
    puts
  end
  
  
end

# m = Main.new

# puts m.parse("./input/1.csv", "space")
# puts m.parse("./input/2.csv", "comma")
# puts m.parse("./input/2.csv")
# puts m.parse("./input/3.csv", "pipe")