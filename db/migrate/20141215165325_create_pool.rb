class CreatePool < ActiveRecord::Migration
  def change

    create_table :pools do |t|
      t.string :name, null: false
      t.string :gender
      t.integer :low_weight
      t.integer :high_weight
      t.belongs_to :tournament
    end

  end
end
