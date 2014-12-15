class CreatePlayersMatches < ActiveRecord::Migration
  def change
    
    create_table :players_matches do |t|
      t.belongs_to :player
      t.belongs_to :match
    end

  end
end
