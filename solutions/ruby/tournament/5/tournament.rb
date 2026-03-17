class Tournament
  def self.tally(input)
    table = "Team                           | MP |  W |  D |  L |  P\n"
    team_stats = Hash.new { |hash, key| hash[key] = { mp: 0, w: 0, d: 0, l: 0, p: 0 } }
    input.split("\n").each do |line|
      team1, team2, result = line.split(';')
      team_stats[team1][:mp] += 1
      team_stats[team2][:mp] += 1
      case result
      when 'win'
        team_stats[team1][:w] += 1
        team_stats[team1][:p] += 3
        team_stats[team2][:l] += 1
      when 'loss'
        team_stats[team1][:l] += 1
        team_stats[team2][:w] += 1
        team_stats[team2][:p] += 3
      when 'draw'
        team_stats[team1][:d] += 1
        team_stats[team1][:p] += 1
        team_stats[team2][:d] += 1
        team_stats[team2][:p] += 1
      end
    end
    team_stats.sort_by { |team, stats| [-stats[:p], team] }.each do |team, stats|
      table += sprintf("%-30s |%3d |%3d |%3d |%3d |%3d\n", team, stats[:mp], stats[:w], stats[:d], stats[:l], stats[:p])
    end
    table
  end
end