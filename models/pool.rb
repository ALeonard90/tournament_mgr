require_relative "../config/environments.rb"
require_relative "./player_match.rb"
require_relative "./player.rb"

class Pool < ActiveRecord::Base
  belongs_to :tournament
  has_many :players
  has_many :matches

  def create_matches
    players = self.players
    i = 1
    
    until Math.log2(players.length) % 1 == 0
      players.insert(i, Player.find_by(name: "Bye"))
      i += 2
    end

    num_matches = players.length / 2

    match_num = 1
    i = 0
    num_matches.times do
      match = Match.new(match_type: "W", number: match_num)
      match.pool = self
      match.save
      PlayerMatch.create(match_id: match.id, player_id: players[i].id) 
      i += 1
      PlayerMatch.create(match_id: match.id, player_id: players[i].id)
      i += 1
      match_num += 1
    end
  end

  def next_match(last_match)
    case last_match.match_type
    when "W"
      if self.check_open_matches("W")
        PlayerMatch.create(match_id: self.check_open_matches("W"), player_id: last_match.winner)
      else
        new_match = Match.create(match_type: "W", number: self.get_next_match_num("W"), pool_id: self.id)
        PlayerMatch.create(match_id: new_match.id, player_id: last_match.winner)
      end
      if self.check_open_matches("L") && last_match.loser.to_i != 1
        PlayerMatch.create(match_id: self.check_open_matches("L"), player_id: last_match.loser)
      else
        new_match = Match.create(match_type: "L", number: self.get_next_match_num("L"), pool_id: self.id)
        PlayerMatch.create(match_id: new_match.id, player_id: last_match.loser)
      end
    when "L"
      if self.check_open_matches("L")
        PlayerMatch.create(match_id: self.check_open_matches("L"), player_id: last_match.winner)
      else
        new_match = Match.create(match_type: "L", number: self.get_next_match_num("L"), pool_id: self.id)
        PlayerMatch.create(match_id: new_match.id, player_id: last_match.winner)
      end
    end
  end

  def check_open_matches(match_type)
    self.matches.each do |match|
      if match.match_type == match_type && match.players.length == 1
        open_match = match
        return open_match.id
      end
    end
    return false
  end

  def get_next_match_num(match_type)
    match_numbers = [0]
    self.matches.each do |match|
      if match.match_type == match_type
        match_numbers << match.number
      end
    end
    return match_numbers.sort.pop + 1
  end

end