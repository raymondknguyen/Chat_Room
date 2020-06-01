class GearItemSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :id, :name, :location
  require "pry"; binding.pry
  attribute :user_location do |gear_item|
    require "pry"; binding.pry
  end

end
