class MatchingItem
  attr_reader :lat,
              :lng,
              :name,
              :url,
              :id,
              :location,
              :price,
              :photo


  def initialize(attributes)
    item = GearItem.find(attributes["attributes"]["id"])
    @lat = attributes["attributes"]["coordinates"]["latitude"]
    @lng = attributes["attributes"]["coordinates"]["longitude"]
    @name = attributes["attributes"]["name"]
    @id = attributes["attributes"]["id"]
    @url = "/gear_items/#{@id}"
    @location = attributes["attributes"]["location"]
    @price = item.price
    @photo = item.photo
  end
end
