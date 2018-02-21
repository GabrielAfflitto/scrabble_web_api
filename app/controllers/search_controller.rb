class SearchController < ApplicationController

  def index
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.headers['app_id'] = ENV['app_id']
      faraday.headers['app_key'] = ENV['app_key']
      faraday.adapter  Faraday.default_adapter
    end
    response = @conn.get("inflections/en/foxes")
    b = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    @search = b[:resulsts].first[:id]
  end

end
