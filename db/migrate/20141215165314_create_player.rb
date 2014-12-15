class CreatePlayer < ActiveRecord::Migration

  def change

    create_table :players do |t|
      t.string :name, null: false
      t.integer :weight, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :rank
      t.belongs_to :tournament
      t.belongs_to :pool
    end

  end

end
