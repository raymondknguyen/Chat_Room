class SearchController<ApplicationController

  def new
  end

  def index
    @gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    #I think this is where we'll want to make the call to our microservice, using @gear_items and location_params
    # request = render json: GearItemSerializer.new(@gear_items, {params: {location: location_params[:location],
    #                                                                      distance: location_params[:distance]}})
    # parsed_request = JSON.parse(request)
    @user_location = {"latitude"=>39.750605, "longitude"=>-104.990926}
    @matching_items = [{"id"=>"1137",
                        "type"=>"gear_item",
                        "attributes"=>
                         {"id"=>"1137",
                          "name"=>"Helmet",
                          "location"=>"Denver, CO",
                          "user_location"=>"Denver, CO",
                          "distance"=>"15",
                          "coordinates"=>{"latitude"=>39.750605, "longitude"=>-104.990926}}},
                       {"id"=>"1139",
                        "type"=>"gear_item",
                        "attributes"=>
                         {"id"=>"1139",
                          "name"=>"Purple Helmet",
                          "location"=>"Denver, CO",
                          "user_location"=>"Denver, CO",
                          "distance"=>"15",
                          "coordinates"=>{"latitude"=>39.750605, "longitude"=>-104.990926}}}]

  end
  private

  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
