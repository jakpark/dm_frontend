require './lib/main.rb'

RSpec.describe Main, "Unit Tests:" do
  main = Main.new

  context "Parse:" do
    it "parses files with delimiter: space" do
      expect(main.parse("./lib/input/1.txt")).to eq (
        [["Kournikova", "Anna", "F", "F", "6-3-1975", "Red"], ["Hingis", "Martina", "M", "F", "4-2-1979", "Green"], ["Seles", "Monica", "H", "F", "12-2-1973", "Black"]]
      )
    end

    it "parses files with delimiter: comma" do
      expect(main.parse("./lib/input/2.txt")).to eq (
        [["Abercrombie", "Neil", "Male", "Tan", "2/13/1943"], ["Bishop", "Timothy", "Male", "Yellow", "4/23/1967"], ["Kelly", "Sue", "Female", "Pink", "7/12/1959"]]
      )
    end

    it "parses files with delimiter: pipe" do
      expect(main.parse("./lib/input/3.txt")).to eq (
        [["Smith", "Steve", "D", "M", "Red", "3-3-1985"], ["Bonk", "Radek", "S", "M", "Green", "6-3-1975"], ["Bouillon", "Francis", "G", "M", "Blue", "6-3-1975"]]
      )
    end

  end
end
