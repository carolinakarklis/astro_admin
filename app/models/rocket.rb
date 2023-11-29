class Rocket
  include ActiveModel::Model

  attr_accessor :name, :km_per_hour, :agency_id, :fuel_days, :load_type_name, :load_type_weight, :load_type_description

end
