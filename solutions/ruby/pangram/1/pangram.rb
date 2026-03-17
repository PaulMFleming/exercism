class Pangram
  def self.pangram?(input)
    alphabet = ("a".."z").to_a
    alphabet.all?{ |l| input.downcase.include?(l) }
  end
end
