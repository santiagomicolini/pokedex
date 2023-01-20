require "rails_helper"

RSpec.describe "pokemons/show" do
  it "displays information about one pokemon" do
    assign(:pokemon, Pokemon.create!(name: "mew",
      abilities: ["synchronize"],
      weight:  "40",
      descriptions: ["psychic"],
      evolutions: ["mew"],
      image:
       "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/151.svg",
      flavours:
       "So rare that it is still said to be a mirage by many experts. Only a few people have seen it worldwide."
      ))
    render
    expect(rendered).to match /mew/
    expect(rendered).to match /So rare that it is still said to be a mirage by many experts./
  end
end
