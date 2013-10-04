module WeatherHelper
  api_key = ""
  $base_url = "http://api.wunderground.com/api/#{api_key}"

  def wunderground_link
    response = call_and_parse("geolookup")
    responseurl = response["location"]["requesturl"]
    return "http://www.wunderground.com/#{responseurl}"
  end

  def get_city(wunder_link)
    city = wunder_link.split('/').last
    city.gsub!(".html","")
    return city
    
  end

  def four_day_forecast
    response = call_and_parse("forecast")
    return response["forecast"]["simpleforecast"]["forecastday"]
  end

  private

  def call_and_parse(type)
    raw_request = RestClient.get "#{$base_url}/#{type}/q/autoip.json"
    parsed_response = JSON.parse(raw_request)
  end
end
