require 'csv'

class Main
  def get_file(filepath)
    arr = []
    
    lines = CSV.foreach(filepath) do |line|
      arr.push(line)
    end
    
    arr
  end
  
  
end

m = Main.new

puts m.get_file("./input/1.csv")