class AddColumnsToPokemon < ActiveRecord::Migration[7.0]
  def change
    add_column :pokemons, :type, :string
    add_column :pokemons, :weight, :string
    add_column :pokemons, :ability, :string
    add_column :pokemons, :description, :string
    add_column :pokemons, :evolution, :string
  end
end
