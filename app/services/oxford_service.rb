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
    if response.status == 200
      "#{word} is a valid word and its root form is #{b[:results].first[:lexicalEntries].first[:inflectionOf].first[:text]}"
    else
      "that is ont a valid word"
    end
  end

end
