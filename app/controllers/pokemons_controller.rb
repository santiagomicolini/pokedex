class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show]

  def index
    if params[:search].present?
      @pokemons = Pokemon.search_pokemons(params[:search])
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
