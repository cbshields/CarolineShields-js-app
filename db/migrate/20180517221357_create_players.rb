class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.string :password_digest
      t.integer :age
      t.string :address

      t.timestamps
    end
  end
end
