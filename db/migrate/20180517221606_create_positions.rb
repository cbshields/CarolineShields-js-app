class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.string :name
      t.integer :player_id
      t.integer :sport_id

      t.timestamps
    end
  end
end
