class ApplicationController < ActionController::Base
  def addition_form
    render("add_templates/muggles.html.erb")
  end
  
  def addition_results
    # Parameters: {"first_num"=>"42", "second_num"=>"10"}

    @first = params.fetch("first_num").to_i
    @second = params.fetch("second_num").to_i

    @result = @first + @second

    render("add_templates/results.html.erb")
  end

  def street_to_coords_results
    # Parameters: {"user_street_address"=>"Merchandise Mart, Chicago"}

    @street_address = params.fetch("user_street_address")

    @maps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @street_address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

    @raw_json_string = open(@maps_url).read

    @parsed_json = JSON.parse(@raw_json_string)

    @results_array = @parsed_json.fetch("results")

    @first_result = @results_array.at(0)
    
    @geometry_hash = @first_result.fetch("geometry")

    @location_hash = @geometry_hash.fetch("location")

    @latitude = @location_hash.fetch("lat")
    @longitude = @location_hash.fetch("lng")

    render("weather_templates/street_to_coords_results.html.erb")
  end
end
