require 'csv'

class Main
  def parse(filepath)
    header = File.open(filepath, &:readline)

    if header =~ /\|/
      delimiter = " | "
    elsif header =~ /\,/
      delimiter = ", "
    else
      delimiter = " "
    end

    arr = []

    lines = CSV.foreach(filepath, col_sep: delimiter) do |line|
      arr.push(line)
    end

    arr
  end


end

# m = Main.new
#
# puts m.parse("./input/1.csv", "space")
# puts m.parse("./input/2.csv", "comma")
# puts m.parse("./input/2.csv")
# puts m.parse("./input/3.csv", "pipe")
