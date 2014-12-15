class CreateTournament < ActiveRecord::Migration
  
  def change

    create_table :tournaments do |t|
      t.string :name, null: false
      t.belongs_to :user
    end

  end
end
