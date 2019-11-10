class RemoveImageFromPokemons < ActiveRecord::Migration[5.2]
  def change
    remove_column :pokemons, :image, :string
  end
end
