class Acronym
  def self.abbreviate(input)
    input.split(/[- ]/).map{|word| word[0]}.join.upcase
  end
end
