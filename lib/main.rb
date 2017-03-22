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
symbols = %w[lastname firstname gender dateofbirth favoritecolor].map(&:to_sym)

solns = []
x = arr.each do |obj|
  printrow = []

  symbols.each do |symbol|  
    printrow.push(obj[symbol])
  end
  
  solns.push(printrow.join(" "))
end

puts solns


# puts "Output 2: "
# puts arr.sort_by { |k| [k[:DateOfBirth], k[:lastname]]}
