class SearchController<ApplicationController

  def new
  end

  def index
    @gear_items = GearItem.find_matches(query_params[:keyword].downcase)
    #I think this is where we'll want to make the call to our microservice, using @gear_items and location_params
  end

  private

  def query_params
    params.permit(:keyword)
  end

  def location_params
    params.permit(:location, :distance)
  end

end
