require_relative 'acronym'

RSpec.describe Acronym do
  describe 'abbreviate' do
    it 'returns PNG when given Portable Network Graphics' do
      expect(described_class.abbreviate('Portable Network Graphics')).to eq('PNG')
    end

     it 'returns ROR when given Ruby on Rails' do
      expect(described_class.abbreviate('Ruby on Rails')).to eq('ROR')
    end

      it 'tests punctuation correctly' do
      expect(described_class.abbreviate('First in, First out')).to eq('FIFO')
    end

    it 'tests all caps word correctly' do
      expect(described_class.abbreviate('GNU Image Manipulation Program')).to eq('GIMP')
    end

    it 'works with punctuation without whitespace' do
      expect(described_class.abbreviate('Complementary metal-oxide semiconductor')).to eq('CMOS')
    end

    it 'works with a very long abbreviation' do
      expect(described_class.abbreviate('Rolling On The Floor Laughing So Hard That My Dogs Came Over And Licked Me')).to eq('ROTFLSHTMDCOALM')
    end

    it 'works with consecutive delimeters' do
      expect(described_class.abbreviate('Something - I made up from thin air')).to eq('SIMUFTA')
    end
  end
end
