require_relative "../config/environments.rb"
require_relative "./player_match.rb"

class Pool < ActiveRecord::Base
  belongs_to :tournament
  has_many :players
  has_many :matches

  def create_matches
    players = self.players
    i = 1
    
    until Math.sqrt(players.length) % 1 == 0
      players.insert(i, Player.find(1))
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

end
