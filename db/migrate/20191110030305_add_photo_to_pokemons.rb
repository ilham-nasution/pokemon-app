class AddPhotoToPokemons < ActiveRecord::Migration[5.2]
  def change
    add_column :pokemons, :photo, :string
  end
end
