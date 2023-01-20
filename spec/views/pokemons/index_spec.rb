require "rails_helper"

RSpec.describe "pokemons/index" do
  it "displays all the pokemons" do
    assign(:pokemons, [
      Pokemon.create!(name: "mew",
        abilities: ["synchronize"],
        weight:  "40",
        descriptions: ["psychic"],
        evolutions: ["mew"],
        image:
         "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/151.svg",
        flavours:
         "So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide."
        ),
      Pokemon.create!(:name => "bulbasaur",
        abilities: ["overgrow", "chlorophyll"],
        weight: "69",
        descriptions: ["grass", "poison"],
        evolutions: ["bulbasaur", "ivysaur", "venusaur"],
        image:
         "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
        flavours:
         "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
    ])

    render

    expect(rendered).to match /mew/
    expect(rendered).to match /bulbasaur/
  end
end
