require_relative "../config/environments.rb"

class Tournament < ActiveRecord::Base

  has_many :pools
  has_many :players
  has_many :matches

end
