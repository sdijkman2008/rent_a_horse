class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.string :address
      t.integer :price
      t.integer :level
      t.string :description

      t.timestamps
    end
  end
end
