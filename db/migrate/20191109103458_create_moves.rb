class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.references :pokemon, foreign_key: true

      t.timestamps
    end
  end
end
