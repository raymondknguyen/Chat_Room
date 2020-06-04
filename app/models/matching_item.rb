class MatchingItem
  attr_reader :lat,
              :lng,
              :name,
              :url,
              :id,
              :location

  def initialize(attributes)
    @lat = attributes["attributes"]["coordinates"]["latitude"]
    @lng = attributes["attributes"]["coordinates"]["longitude"]
    @name = attributes["attributes"]["name"]
    @id = attributes["attributes"]["id"]
    @url = "/gear_items/#{@id}"
    @location = attributes["attributes"]["location"]
  end
end
