class CreatePokemons < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :abilities
      t.string :weight
      t.string :descriptions
      t.string :evolutions
      t.string :image

      t.timestamps
    end
  end
end
