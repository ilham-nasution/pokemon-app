class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :edit, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def index_grass
    @pokemons = Pokemon.joins(:types).where(types: { name: "grass" })
  end

  def index_water
    @pokemons = Pokemon.joins(:types).where(types: { name: "water" })
  end

  def index_fire
    @pokemons = Pokemon.joins(:types).where(types: { name: "fire" })
  end

  def show
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    if @pokemon.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pokemon.update(pokemon_params)
    redirect_to pokemon_path(@pokemon)
  end

  def destroy
    @pokemon.destroy
    redirect_to pokemons_path
  end

  private

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end

  def pokemon_params
    params.require(:pokemon).permit(:name, :photo)
  end
end
