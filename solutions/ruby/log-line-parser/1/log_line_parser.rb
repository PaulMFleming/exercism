class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.gsub(/\[.*\]:\s*/, '').strip
  end

  def log_level
    @line.match(/\[.*\]/).to_s.gsub(/\[|\]/, '').downcase.strip
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
