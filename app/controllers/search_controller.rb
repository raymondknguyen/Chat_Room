class SearchController<ApplicationController

  def new
  end

  def index
    gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    if gear_items.length > 0
      request = GearItemSerializer.new(gear_items, {params: {location: location_params[:location],
                                                             distance: location_params[:distance]}}).serialized_json
      get_matching_items(request)
      get_user_coordinates(request)
    else
      flash[:error] = "Sorry, no items match your search"
      redirect_back(fallback_location: "/")
    end
  end

  private

  def get_matching_items(request)
    item_response = GearHubService.new.item_results(request)
    parsed_item_response = JSON.parse(item_response.body)
    @results = parsed_item_response.map do |item_info|
      MatchingItem.new(item_info)
    end
    @json_results = @results.to_json.html_safe
  end

  def get_user_coordinates(request)
    coordinate_response = GearHubService.new.coordinate_results(request)
    @coordinates = JSON.parse(coordinate_response.body)
  end


  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
