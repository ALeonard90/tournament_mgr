class CreatePool < ActiveRecord::Migration
  def change

    create_table :pools do |t|
      t.string :name, null: false
      t.string :gender
      t.string :rank
      t.integer :min_age
      t.integer :max_age
      t.integer :min_weight
      t.integer :max_weight
      t.belongs_to :tournament
    end

  end
end
