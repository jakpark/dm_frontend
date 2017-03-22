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

    body = File.read(filepath)
    body = header + "\n" + body

    arr = []

    CSV::Converters[:blank_to_nil] = lambda do |field|
      field && field.empty? ? nil : field
    end

    lines = CSV.new(body, col_sep: delimiter, headers: true, :header_converters => :symbol, :converters => [:all, :blank_to_nil])
    arr = lines.to_a.map{|row| row.to_hash}
  end


end

# m = Main.new
#
# puts m.parse("./input/1.txt")
# puts m.parse("./input/2.txt")
# puts m.parse("./input/3.txt")
