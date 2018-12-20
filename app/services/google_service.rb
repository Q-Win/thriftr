class GoogleService

  def initialize(coords)
    @coords = coords
  end

  def location_search
    results = conn.get "/maps/api/place/nearbysearch/json", opts

    JSON.parse(results.body, symbolize_names: true)[:results]
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com")
  end

  def opts
    {
      location: @coords,
      radius: 500,
      key: ENV['GOOGLE_API_KEY']
    }
  end

end
