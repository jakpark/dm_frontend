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

    body = File.read(filepath).gsub("/", "-")
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


end

m = Main.new

arr = []
arr.concat(m.parse("./input/1.txt"))
arr.concat(m.parse("./input/2.txt"))
arr.concat(m.parse("./input/3.txt"))

puts "Output 1: "
arr = arr.sort_by { |k| [k[:gender], k[:lastname]]}
x = arr.each do |obj|
  printrow = ""
  printrow = obj[:lastname] + " " + obj[:firstname] + " " +
    obj[:gender] + " " + obj[:dateofbirth] + " " + obj[:favoritecolor]
  puts printrow
end

puts 
"Hingis Martina Female 4/2/1979 Green
Kelly Sue Female 7/12/1959 Pink
Kournikova Anna Female 6/3/1975 Red
Seles Monica Female 12/2/1973 Black
Abercrombie Neil Male 2/13/1943 Tan
Bishop Timothy Male 4/23/1967 Yellow
Bonk Radek Male 6/3/1975 Green
Bouillon Francis Male 6/3/1975 Blue
Smith Steve Male 3/3/1985 Red"

# puts "sort2: "
# puts arr.sort_by { |k| [k[:DateOfBirth], k[:lastname]]}
