class SpaceTravelsController < ApplicationController
  def index
    @travels = SpaceRegister.get_travels
  end

  def new
    @travel = SpaceTravel.new
  end

  def create
    build_params = { space_travel: space_travel_params.to_h } 
    travel = SpaceRegister.create_travel(build_params)

    if travel.success == true
      redirect_to space_travels_path
    else
      render :new
    end
  end

  private

  def space_travel_params
    params.require(:space_travel).permit(:start_at, :planet_id, :space_vehicle_id, :mission_description)
  end
end
