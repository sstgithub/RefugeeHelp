class CoordsController < ApplicationController
  def index
    @coords = Coord.all
    render json: @coords
  end
end
