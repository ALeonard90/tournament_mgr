class CreateMatch < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.string :type, null: false
      t.integer :number, null: false
      t.integer :winner
      t.integer :loser
      t.belongs_to :pool
    end
  end
end
