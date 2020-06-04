class GearHubService

  def conn
    Faraday.new(url: 'https://frozen-coast-45441.herokuapp.com')
  end

  def item_results(request)
    conn.post("/locations?items=#{request}")
  end

  def coordinate_results(request)
    conn.post("/user_location?items=#{request}")
  end
end 
