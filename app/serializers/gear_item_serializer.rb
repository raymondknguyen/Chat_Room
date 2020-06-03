class GearItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name, :location

  attribute :user_location do |gear_item, params|
    params[:location]
  end

  attribute :distance do |gear_item, params|
    params[:distance]
  end 

end
