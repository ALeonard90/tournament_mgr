require_relative "../config/environments.rb"

class Match < ActiveRecord::Base

  has_many :player_matches
  has_many :players, through: :player_matches
  belongs_to :pool
  
  def set_winner(player_id)
    players = self.players
    players.each do |player|
      if player.id == player_id
        self.winner = player.id
      else
        self.loser = player.id
      end
    end
    self.save
  end

end
