require_relative 'isogram'

RSpec.describe Isogram do
  describe "#isogram?" do
    it "returns true when given an empty string" do
      expect(described_class.isogram?("")).to be true
    end

    it "returns true with only lower case letters" do
      expect(described_class.isogram?("isogram")).to be true
    end

    it "returns false when there's a single duplicated character" do
      expect(described_class.isogram?("eleven")).to be false
    end

    it "returns false when there's a duplicated character dfrom the end of the alphabet" do
      expect(described_class.isogram?("zzyzx")).to be false
    end

    it "returns true with the longest English isogram" do
      expect(described_class.isogram?("subdermatoglyphic")).to be true
    end

    it "returns false when there's a duplicated letter in mixed case" do
      expect(described_class.isogram?("Alphabet")).to be false
    end

    it "returns false with a duplicated character in mixed case where lowercase is first" do
      expect(described_class.isogram?("alphAbet")).to be false
    end

    it "returns true with a hyphenated isogram" do
      expect(described_class.isogram?("thumbscrew-japingly")).to be true
    end

    it "returns false with a hyphenated word and duplicate character after hyphen" do
      expect(described_class.isogram?("thumbscrew-jappingly")).to be false
    end

    it "returns true with duplicated hyphen" do
      expect(described_class.isogram?("six-year-old")).to be true
    end

    it "returns true with a made up name thats an isogram" do
      expect(described_class.isogram?("Emily Jung Schwartzkopf")).to be true
    end

    it "returns false with a duplicated character in the middle" do
      expect(described_class.isogram?("accentor")).to be false
    end

    it "returns false with the same first and last letters" do
      expect(described_class.isogram?("angola")).to be false
    end

    it "returns false with duplicated character and two hyphens" do
      expect(described_class.isogram?("up-to-date")).to be false
    end
  end
end
