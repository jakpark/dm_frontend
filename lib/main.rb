require 'csv'

class Main
  def parse(filepath)
    firstline = File.open(filepath, &:readline)

    headers_comma = "LastName, FirstName, Gender, FavoriteColor, DateOfBirth"
    headers_space = "LastName FirstName MiddleInitial Gender DateOfBirth FavoriteColor"
    headers_pipe = "LastName | FirstName | MiddleInitial | Gender | FavoriteColor | DateOfBirth"

    if firstline =~ /\|/
      delimiter = " | "
      header = headers_pipe
    elsif firstline =~ /\,/
      delimiter = ", "
      header = headers_comma
    else
      delimiter = " "
      header = headers_space
    end

    body = File.read(filepath).gsub("-", "/")
    body = header + "\n" + body

    arr = []

    CSV::Converters[:blank_to_nil] = lambda do |field|
      field && field.empty? ? nil : field
    end

    lines = CSV.new(body, col_sep: delimiter, headers: true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
    arr = lines.to_a.map do |row|
      row_h = row.to_hash
      if row_h[:gender] == "M"
        row_h[:gender] = "Male"
      elsif row_h[:gender] == "F"
        row_h[:gender] = "Female"
      end
      
      row_h
    end
  end

  
  def self.format_date_iso(date)
    formatted = date.split("/").map do |x| 
       if x.length < 2 
         x = "0" + x
       else
         x
       end
    end
    
    formatted.rotate(-1).join('/') # Rotate ISO: YYYY,MM,DD
  end


  def self.pretty_print(arr)
    symbols = %w[lastname firstname gender dateofbirth favoritecolor].map(&:to_sym)

    solns = []
    arr.each do |obj|
      printrow = []

      symbols.each do |symbol|  
        printrow.push(obj[symbol])
      end
      
      solns.push(printrow.join(" "))
    end

    solns
  end

end

m = Main.new

output = []
output.concat(m.parse("./input/1.txt"))
output.concat(m.parse("./input/2.txt"))
output.concat(m.parse("./input/3.txt"))

puts "Output 1: "
output1 = output.sort_by { |k| [k[:gender], k[:lastname]]}

puts Main.pretty_print(output1)
puts

puts "Output 2: "
output2 = output.sort_by { |k| [Main.format_date_iso(k[:dateofbirth]), k[:lastname]]}

puts Main.pretty_print(output2)
puts


puts "Output 3: "
output3 = output.sort_by { |k| k[:lastname]}.reverse

puts Main.pretty_print(output3)
