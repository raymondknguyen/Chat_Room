class SearchController<ApplicationController

  def new
  end

  def index
    @gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    #I think this is where we'll want to make the call to our microservice, using @gear_items and location_params
    @coordinates = {"latitude"=>39.750605, "longitude"=>-104.990926}
    parsed_response = [{"id"=>"1137",
      "type"=>"gear_item",
      "attributes"=>
       {"id"=>"1",
        "name"=>"Helmet",
        "location"=>"Denver, CO",
        "user_location"=>"Denver, CO",
        "distance"=>"15",
        "coordinates"=>{"latitude"=>39.750605, "longitude"=>-104.990926}}},
     {"id"=>"1139",
      "type"=>"gear_item",
      "attributes"=>
       {"id"=>"2",
        "name"=>"Purple Helmet",
        "location"=>"Denver, CO",
        "user_location"=>"Denver, CO",
        "distance"=>"15",
        "coordinates"=>{"latitude"=>39.750605, "longitude"=>-104.990926}}}]

      results = []
      parsed_response.each do |item|
        result = {lat: item["attributes"]["coordinates"]["latitude"],
         lng: item["attributes"]["coordinates"]["longitude"],
         name: item["attributes"]["name"],
         url: "/gear_items/#{item["attributes"]["id"]}"
        }
        results << result
      end
      @json_results = results.to_json.html_safe

  end

  private

  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
