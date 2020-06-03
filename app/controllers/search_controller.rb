class SearchController<ApplicationController

  def new
  end

  def index
    gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    request = GearItemSerializer.new(gear_items, {params: {location: location_params[:location],
                                                                     distance: location_params[:distance]}}).serialized_json


    # conn = Faraday.new(
    #   url: 'https://frozen-coast-45441.herokuapp.com')
    #
    # item_results = conn.post("/locations?items=#{request}")
    # coordinate_results = conn.post("/user_location?items=#{request}")
    item_response = GearHubService.new.item_results(request)
    @parsed_item_response = JSON.parse(item_response.body)
    results = []
    @parsed_item_response.each do |item|
      result = {lat: item["attributes"]["coordinates"]["latitude"],
       lng: item["attributes"]["coordinates"]["longitude"],
       name: item["attributes"]["name"],
       url: "/gear_items/#{item["attributes"]["id"]}"
      }
      results << result
    end
    @json_results = results.to_json.html_safe

    coordinate_response = GearHubService.new.coordinate_results(request)
    @coordinates = JSON.parse(coordinate_response.body)
  end

  private

  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
