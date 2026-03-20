require_relative 'isbn_verifier'

RSpec.describe IsbnVerifier do
  describe 'valid?' do
    it 'tests valid isbn and returns true' do
      expect(described_class.valid?('3-598-21508-8')).to be true
    end

    it 'returns false with incorrect isbn digit check' do
      expect(described_class.valid?('3-598-21508-9')).to be false
    end

    it 'is successful with valid isbn containing a digit of 10' do
      expect(described_class.valid?('3-598-21507-X')).to be true
    end

    it 'fails with isbn containing a non x character' do
      expect(described_class.valid?('3-598-21507-A')).to be false
    end

    it 'fails with invalid check digit in isbn not treated as zero' do
      expect(described_class.valid?('4-598-21507-B')).to be false
    end

    it 'fails with invalid character in isbn not treated as zero' do
      expect(described_class.valid?('3-598-P1581-X')).to be false
    end

    it 'fails when X is in invalid position' do
      expect(described_class.valid?('3-598-2X507-9')).to be false
    end

    it 'passes with valid isbn and no dashes' do
      expect(described_class.valid?('3598215088')).to be true
    end

    it 'passes on valid isbn with X and no dashes' do
      expect(described_class.valid?('359821507X')).to be true
    end

    it 'fails with isbn that has no check digit and no dashes' do
      expect(described_class.valid?('359821507')).to be false
    end

    it 'fails when isbn is too long and no dashes' do
      expect(described_class.valid?('3598215078X')).to be false
    end

    it 'fails when isbn is too short' do
      expect(described_class.valid?('00')).to be false
    end

    it 'fails on isbn without check digit' do
      expect(described_class.valid?('3-598-21507')).to be false
    end

    it 'fails when check digit of x is not used for 0' do
      expect(described_class.valid?('3-598-21515-X')).to be false
    end

    it 'fails with empty isbn' do
      expect(described_class.valid?('')).to be false
    end

    it 'fails with input of 9 characters' do
      expect(described_class.valid?('134456729')).to be false
    end

    it 'fails if invalid chars are not ignored after checking length' do
      expect(described_class.valid?('3132P34035')).to be false
    end

    it 'fails when invalid characters are not ignored before checking length' do
      expect(described_class.valid?('3598P215088')).to be false
    end

    it 'fails when inout is too long but contains a valid isbn' do
      expect(described_class.valid?('98245726788')).to be false
    end
  end
end
