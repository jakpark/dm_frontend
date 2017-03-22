require './lib/main.rb'

RSpec.describe Main, "Unit Tests:" do
  main = Main.new

  context "Parse:" do
    it "parses files with delimiter: space" do
      expect(main.parse("./lib/input/1.txt")).to eq (
        [
          {:lastname=>"Kournikova", :firstname=>"Anna", :middleinitial=>"F", :gender=>"F", :dateofbirth=>"6-3-1975", :favoritecolor=>"Red"},
          {:lastname=>"Hingis", :firstname=>"Martina", :middleinitial=>"M", :gender=>"F", :dateofbirth=>"4-2-1979", :favoritecolor=>"Green"},
          {:lastname=>"Seles", :firstname=>"Monica", :middleinitial=>"H", :gender=>"F", :dateofbirth=>"12-2-1973", :favoritecolor=>"Black"}
        ]
      )
    end

    it "parses files with delimiter: comma" do
      expect(main.parse("./lib/input/2.txt")).to eq (
        [
          {:lastname=>"Abercrombie", :firstname=>"Neil", :gender=>"Male", :favoritecolor=>"Tan", :dateofbirth=>"2/13/1943"},
          {:lastname=>"Bishop", :firstname=>"Timothy", :gender=>"Male", :favoritecolor=>"Yellow", :dateofbirth=>"4/23/1967"},
          {:lastname=>"Kelly", :firstname=>"Sue", :gender=>"Female", :favoritecolor=>"Pink", :dateofbirth=>"7/12/1959"}
        ]
      )
    end

    it "parses files with delimiter: pipe" do
      expect(main.parse("./lib/input/3.txt")).to eq (
        [
          {:lastname=>"Smith", :firstname=>"Steve", :middleinitial=>"D", :gender=>"M", :favoritecolor=>"Red", :dateofbirth=>"3-3-1985"},
          {:lastname=>"Bonk", :firstname=>"Radek", :middleinitial=>"S", :gender=>"M", :favoritecolor=>"Green", :dateofbirth=>"6-3-1975"},
          {:lastname=>"Bouillon", :firstname=>"Francis", :middleinitial=>"G", :gender=>"M", :favoritecolor=>"Blue", :dateofbirth=>"6-3-1975"}
        ]
      )
    end

  end
end
