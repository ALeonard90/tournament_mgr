require_relative "../config/environments.rb"


class Player < ActiveRecord::Base

  belongs_to :tournament
  belongs_to :pool
  has_many :players_matches
  has_many :matches, through: :players_matches
  
  def add_to_pool
    pool = Pool.where(
        "tournament_id = :tournament_id AND 
        gender = :gender AND 
        rank = :rank AND 
        max_weight >= :weight AND 
        min_weight <= :weight AND
        max_age >= :age AND
        min_age <= :age",
        {
          tournament_id: tournament_id,
          gender: gender,
          rank: rank,
          weight: weight,
          age: age
        }).first
    
    unless pool
      return false
    else
      self.pool = pool
    end 
  end
    
end
