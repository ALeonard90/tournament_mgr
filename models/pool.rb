require_relative "../config/environments.rb"

class Pool < ActiveRecord::Base
  belongs_to :tournament
  has_many :players
  has_many :matches

end
