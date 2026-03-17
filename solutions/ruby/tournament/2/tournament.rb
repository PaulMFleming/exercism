class Tournament
  HEADER = "Team                           | MP |  W |  D |  L |  P\n"

  def self.tally(input)
    if input == ""
      HEADER
    else
      array_of_strings = input.split("\n")
      array_of_hashes = array_of_strings.map do |string|
        values = string.split(";")
        { home_team: values[0], away_team: values[1], result: values[2] }
      end

      hash_of_teams = array_of_hashes.each_with_object({}) do |hash, teams|
        teams[hash[:home_team]] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
        teams[hash[:away_team]] ||= { mp: 0, w: 0, d: 0, l: 0, p: 0 }
      
        teams[hash[:home_team]][:mp] += 1
        teams[hash[:away_team]][:mp] += 1
      
        case hash[:result]
        when "win"
          teams[hash[:home_team]][:w] += 1
          teams[hash[:home_team]][:p] += 3
          teams[hash[:away_team]][:l] += 1
        when "draw"
          teams[hash[:home_team]][:d] += 1
          teams[hash[:home_team]][:p] += 1
          teams[hash[:away_team]][:d] += 1
          teams[hash[:away_team]][:p] += 1
        when "loss"
          teams[hash[:home_team]][:l] += 1
          teams[hash[:away_team]][:w] += 1
          teams[hash[:away_team]][:p] += 3
        end
      end
      hash_of_teams = hash_of_teams.sort_by { |team, stats| -stats[:p] }.to_h

      HEADER
      results_table = hash_of_teams.each do |team, stats|
        "#{team                            } | #{stats[:mp]} | #{stats[:w]} | #{stats[:d]} | #{stats[:l]} | #{stats[:p]}"
      end
    end
  end
end
