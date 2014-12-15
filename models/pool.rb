require_relative "../config/environments.rb"

class Pool < ActiveRecord::Base
  has_many :players
  has_many :matches

end
