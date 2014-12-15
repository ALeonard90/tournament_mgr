require_relative "../config/environments.rb"

class Player < ActiveRecord::Base

  belongs_to :tournament
  belongs_to :pool
  has_many :players_matches
  has_many :matches, through: :players_matches
  
end
