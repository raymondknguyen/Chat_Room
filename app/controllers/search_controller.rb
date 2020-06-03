class SearchController<ApplicationController

  def new
  end

  def index
    gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    #I think this is where we'll want to make the call to our microservice, using @gear_items and location_params
    request = GearItemSerializer.new(gear_items, {params: {location: location_params[:location],
                                                                     distance: location_params[:distance]}}).serialized_json

    conn = Faraday.new(
      url: 'https://frozen-coast-45441.herokuapp.com')

    item_results = conn.post("/locations?items=#{request}")
    coordinate_results = conn.post("/user_location?items=#{request}")

      @parsed_response = JSON.parse(item_results.body)

      results = []
      @parsed_response.each do |item|
        result = {lat: item["attributes"]["coordinates"]["latitude"],
         lng: item["attributes"]["coordinates"]["longitude"],
         name: item["attributes"]["name"],
         url: "/gear_items/#{item["attributes"]["id"]}"
        }
        results << result
      end
      @json_results = results.to_json.html_safe
      @coordinates = JSON.parse(coordinate_results.body)
  end

  private

  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
