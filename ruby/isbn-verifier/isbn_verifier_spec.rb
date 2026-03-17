require_relative 'isbn_verifier'

RSpec.describe IsbnVerifier do
  describe 'valid?' do
    it 'tests valid isbn and returns true' do
      expect(described_class.valid?('3-598-21508-8')).to be true
    end
  end
end
