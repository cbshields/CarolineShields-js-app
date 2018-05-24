class PositionsController < ApplicationController
before_action :find_position, only: [:show, :edit, :update, :destroy]
  def index
    @positions = Position.all
  end

  def show
  end

  private
  def find_position
    @position = Position.find(params[:id])
  end



end #Ends PositionsController
