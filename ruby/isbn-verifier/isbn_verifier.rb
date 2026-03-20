class IsbnVerifier
  def self.valid?(input)
    chars = input.gsub('-', '').chars
    return false unless chars.size == 10
    return false unless chars.all? { |c| c.match?(/\d/) } || (chars[0..8].all? { |c| c.match?(/\d/) } && chars[9] == 'X')
    has_x = chars[-1] == ('X')
    if has_x
      chars[-1] = '10'
    end
    nums = chars.map(&:to_i)
    sum = 0
    nums.each_with_index do |digit, index|
      multipler = nums.length - index
      sum += digit * multipler
    end
    sum % 11 == 0
  end
end
