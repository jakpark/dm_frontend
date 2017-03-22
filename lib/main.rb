require_relative 'parser'

m = Parser.new

output = []
output.concat(m.parse("./input/1.txt"))
output.concat(m.parse("./input/2.txt"))
output.concat(m.parse("./input/3.txt"))

puts "Output 1: "
output1 = output.sort_by { |k| [k[:gender], k[:lastname]]}

puts Parser.pretty_print(output1)
puts

puts "Output 2: "
output2 = output.sort_by { |k| [Parser.format_date_iso(k[:dateofbirth]), k[:lastname]]}

puts Parser.pretty_print(output2)
puts


puts "Output 3: "
output3 = output.sort_by { |k| k[:lastname]}.reverse

puts Parser.pretty_print(output3)
