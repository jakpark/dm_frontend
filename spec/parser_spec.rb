require './lib/parser.rb'

RSpec.describe Parser, "Unit Tests:" do
  parser_instance = Parser.new

  context "Parse:" do
    it "parses files with delimiter: space" do
      expect(parser_instance.parse("./lib/input/1.txt")).to eq (
        [
          {:lastname=>"Kournikova", :firstname=>"Anna", :middleinitial=>"F", :gender=>"Female", :dateofbirth=>"6/3/1975", :favoritecolor=>"Red"},
          {:lastname=>"Hingis", :firstname=>"Martina", :middleinitial=>"M", :gender=>"Female", :dateofbirth=>"4/2/1979", :favoritecolor=>"Green"},
          {:lastname=>"Seles", :firstname=>"Monica", :middleinitial=>"H", :gender=>"Female", :dateofbirth=>"12/2/1973", :favoritecolor=>"Black"}
        ]
      )
    end

    it "parses files with delimiter: comma" do
      expect(parser_instance.parse("./lib/input/2.txt")).to eq (
        [
          {:lastname=>"Abercrombie", :firstname=>"Neil", :gender=>"Male", :favoritecolor=>"Tan", :dateofbirth=>"2/13/1943"},
          {:lastname=>"Bishop", :firstname=>"Timothy", :gender=>"Male", :favoritecolor=>"Yellow", :dateofbirth=>"4/23/1967"},
          {:lastname=>"Kelly", :firstname=>"Sue", :gender=>"Female", :favoritecolor=>"Pink", :dateofbirth=>"7/12/1959"}
        ]
      )
    end

    it "parses files with delimiter: pipe" do
      expect(parser_instance.parse("./lib/input/3.txt")).to eq (
        [
          {:lastname=>"Smith", :firstname=>"Steve", :middleinitial=>"D", :gender=>"Male", :favoritecolor=>"Red", :dateofbirth=>"3/3/1985"},
          {:lastname=>"Bonk", :firstname=>"Radek", :middleinitial=>"S", :gender=>"Male", :favoritecolor=>"Green", :dateofbirth=>"6/3/1975"},
          {:lastname=>"Bouillon", :firstname=>"Francis", :middleinitial=>"G", :gender=>"Male", :favoritecolor=>"Blue", :dateofbirth=>"6/3/1975"}
        ]
      )
    end

  end
end
