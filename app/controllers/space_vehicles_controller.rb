class SpaceVehiclesController < ApplicationController
  def index
    @vehicles = SpaceRegister.get_vehicles
  end
end
