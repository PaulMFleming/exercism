require_relative 'pangram'

RSpec.describe Pangram do
  describe 'pangram?' do
    it 'returns False on an empty sentence' do
      expect(described_class.pangram?('')).to be false
    end

    it 'tests perfect lower case' do
      expect(described_class.pangram?('abcdefghijklmnopqrstuvwxyz')).to be true
    end

    it 'tests only lower case in a sentence' do
      expect(described_class.pangram?('the quick brown fox jumps over the lazy dog')).to be true
    end

    it 'fails when the letter x is missing' do
      expect(described_class.pangram?('a quick movement of the enemy will jeopardize five gunboats')).to be false
    end

      it 'fails when the letter h is missing' do
      expect(described_class.pangram?('five boxing wizards jump quickly at it')).to be false
    end

    it 'passes when underscores are used' do
      expect(described_class.pangram?('the_quick_brown_fox_jumps_over_the_lazy_dog')).to be true
    end

    it 'passes with numbers' do
      expect(described_class.pangram?('the 1 quick brown fox jumps over the 2 lazy dogs')).to be true
    end

    it 'fails when numbers replace letters' do
      expect(described_class.pangram?('7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog')).to be false
    end

    it 'passes with mixed case and punctuation' do
      expect(described_class.pangram?('Five quacking Zephyrs jolt my wax bed.')).to be true
    end

    it 'fails with a sequence of 26 different characters that are not a pangram' do
      expect(described_class.pangram?('abcdefghijklm ABCDEFGHIJKLM')).to be false
    end
  end
end
