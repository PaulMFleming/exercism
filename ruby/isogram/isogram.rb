class Isogram
  def self.isogram?(input)
    normalize = input.gsub(/[ \-]/, "")
    normalize.downcase.chars.uniq.size == normalize.size
  end
end
