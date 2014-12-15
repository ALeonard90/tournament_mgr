require_relative "../config/environments.rb"

class Match < ActiveRecord::Base

  has_many :players_matches
  has_many :players, through: :players_matches
  belongs_to :pool
  
end
