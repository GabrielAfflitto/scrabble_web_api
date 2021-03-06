class OxfordService
  attr_reader :conn
  def initialize
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.headers['app_id'] = ENV['app_id']
      faraday.headers['app_key'] = ENV['app_key']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def validate_word(word)
    response = @conn.get("inflections/en/#{word}")
    if response.status == 404
      return false
    else
      JSON.parse(response.body, symbolize_names: true)
    end
  end

end
