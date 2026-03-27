class IsbnVerifier
  def self.valid?(input)
    chars = clean_input(input)
    return false unless check_length?(chars)
    return false unless all_digits?(chars) || valid_with_x?(chars)

    chars[-1] = '10' if chars[-1] == 'X'
    nums = chars.map(&:to_i)
    sum = 0
    nums.each_with_index do |digit, index|
      multiplier = nums.length - index
      sum += digit * multiplier
    end
    (sum % 11).zero?
  end

  def self.clean_input(input)
    input.gsub('-', '').chars
  end

  def self.check_length?(chars)
    chars.size == 10
  end

  def self.all_digits?(chars)
    chars.all? { |c| c.match?(/\d/) }
  end

  def self.valid_with_x?(chars)
    chars[0..8].all? { |c| c.match?(/\d/) } && chars[-1] == 'X'
  end
end
