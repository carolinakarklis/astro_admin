class RocketsController < ApplicationController
  def new
    @rocket = Rocket.new
  end

  def create
    rocket = SpaceRegister.create_vehicle(build_params)

    if rocket.success == true
      redirect_to space_vehicles_path
    else
      render :new
    end
  end

  private

  def rocket_params
    params.require(:rocket).permit(
      :name, :km_per_hour, :agency_id,
      :fuel_days, :load_type_name,
      :load_type_weight, :load_type_description
    )
  end

  def build_params
    vehicle_params = { 
      space_vehicle: rocket_params.slice(:name, :km_per_hour, :agency_id).to_h
    }

    vehicle_params[:space_vehicle][:rocket_attributes] = rocket_params.slice(
      :fuel_days, :load_type_name,
      :load_type_weight, :load_type_description
    ).to_h

    vehicle_params
  end

end
