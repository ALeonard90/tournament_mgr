require_relative "../config/environments.rb"

class Match < ActiveRecord::Base

  has_many :player_matches
  has_many :players, through: :player_matches
  belongs_to :pool
  
end
