module WeatherHelper
  api_key = ""
  $base_url = "http://api.wunderground.com/api/#{api_key}"

  # def generate_forecast_url
  #   response = call_and_parse("geolookup")
  #   responseurl = response["location"]["requesturl"].gsub("html","json")
  #   return "#{$base_url}/forecast/q/" + responseurl
  # end

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
