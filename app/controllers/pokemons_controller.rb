class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    @pokemons = Pokemon.destroy_all

    if params[:query]
      @pokemons = Pokemon.search_pokemons(params[:query])
    else
      @pokemons = Pokemon.all
    end
  end

  def show
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
