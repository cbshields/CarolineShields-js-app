class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :player_id
      t.integer :sport_id
      t.string :position

      t.timestamps
    end
  end
end
