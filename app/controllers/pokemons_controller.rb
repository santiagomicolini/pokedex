class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    # I use if else statment to check if there is query present in the search bar.
    if params[:search].present?
      # In case that we have a query, it will search for th items contain in the
      # query params in the tables that I define in pg_searh in the model
      @pokemons = Pokemon.search_pokemons(params[:search])
    else
      # In case that there isn'n query params present it will show all the pokemons.
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
