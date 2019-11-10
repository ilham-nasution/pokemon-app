class MovesController < ApplicationController
  before_action :set_move, only: [:destroy]

  def new
    @pokemon = Pokemon.find(params[:pokemon_id])
    @move = Move.new
  end

  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @move = Move.new(move_params)
    @move.pokemon = @pokemon
    if @move.save
      redirect_to pokemon_path(@pokemon)
    else
      render :new
    end
  end

  def destroy
    @pokemon = @move.pokemon
    @move.destroy
    redirect_to edit_pokemon_path(@pokemon)
  end

  private

  def set_move
    @move = Move.find(params[:id])
  end

  def move_params
    params.require(:move).permit(:name)
  end
end
