require 'rails_helper'

RSpec.describe PokemonsController, type: :controller do
  before do
    @pokemon = Pokemon.create(name: "Bulbasaur", abilities: ["overgrow", "chlorophyll"], weight: "69", descriptions: ["grass", "poison"], evolutions: ["bulbasaur", "ivysaur", "venusaur"],image:
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg", flavours:
      "A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.")
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET show' do
    it "renders the show template" do
      get :show, params: { id: @pokemon.to_param }
      expect(response).to render_template("show")
    end

    it 'returns a 200 response' do
      get :show, params: { id: @pokemon.to_param }
      expect(response).to have_http_status(200)
    end
  end
end
