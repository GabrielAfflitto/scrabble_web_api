class OxfordService
  attr_reader :word, :conn
  def initialize(word)
    @word = word
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com/api/v1") do |faraday|
      faraday.headers['app_id'] = ENV['app_id']
      faraday.headers['app_key'] = ENV['app_key']
      faraday.adapter  Faraday.default_adapter
    end
  end

  def get_word
    response = @conn.get("inflections/en/#{word}")
    b = JSON.parse(response.body, symbolize_names: true)
    binding.pry
  end

  def validate_word

  end

  # def get_json(url)
  #   response = @conn.get(url)
  #   b = JSON.parse(response.body, symbolize_names: true)
  # end

end
