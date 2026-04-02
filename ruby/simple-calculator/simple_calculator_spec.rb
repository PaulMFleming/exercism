require_relative 'simple_calculator'

RSpec.describe SimpleCalculator do
  describe 'calculate' do
    it 'correctly works with addition' do
      expect(described_class.calculate(22, 25, '+')).to eq('22 + 25 = 47')
    end

    it 'correctly works with multiplication' do
      expect(described_class.calculate(3, 21, '*')).to eq('3 * 21 = 63')
    end

    it 'correctly works with division' do
      expect(described_class.calculate(72, 9, '/')).to eq('72 / 9 = 8')
    end

    it 'raises an exception when dividing by zero' do
      expect(described_class.calculate(33, 0, '/')).to eq('Division by zero is not allowed.')
    end

    it 'raises ArgumentError if first operand is not a number' do
      expect { described_class.calculate('1', 2, '+') }.to raise_error(ArgumentError)
    end

    it 'raises ArguementError if second operand is not a number' do
      expect { described_class.calculate(1, '2', '+') }.to raise_error(ArgumentError)
    end

    it 'raises UnsupportedOperation for non valid operations' do
      expect { described_class.calculate(1, 2, '**') }.to raise_error(SimpleCalculator::UnsupportedOperation)
    end

    it 'raises UnsupportedOperation for non valid operations' do
      expect { described_class.calculate(1, 2, nil) }.to raise_error(SimpleCalculator::UnsupportedOperation)
    end

    it 'raises UnsupportedOperation for non valid operations' do
      expect { described_class.calculate(1, 2, '') }.to raise_error(SimpleCalculator::UnsupportedOperation)
    end
  end
end
