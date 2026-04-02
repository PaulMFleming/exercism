class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  class UnsupportedOperation < StandardError
  end

  def self.calculate(first_operand, second_operand, operation)
    raise(ArgumentError) unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
    raise(UnsupportedOperation) unless ALLOWED_OPERATIONS.include?(operation)
    if operation == '+'
      answer = first_operand + second_operand
    elsif operation == '/'
      if second_operand == 0
        return 'Division by zero is not allowed.'
      else
        answer = first_operand / second_operand
      end
    elsif operation == '*'
      answer = first_operand * second_operand
    end

    "#{first_operand} #{operation} #{second_operand} = #{answer}"
  end
end


