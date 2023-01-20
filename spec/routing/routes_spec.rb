require "rails_helper"

RSpec.describe "Pokemon routes", type: :routing do
  it "routes /pokemons to the pokemons controller" do
    expect(get("/pokemons")).to route_to(
      controller: 'pokemons',
      action: 'index'
    )
  end

  it "routes /pokemon/:id to the pokemons controller" do
    expect(get("/pokemons/pokemon")).to route_to(
      controller: 'pokemons',
      action: 'show',
      id: 'pokemon'
    )
  end
end
