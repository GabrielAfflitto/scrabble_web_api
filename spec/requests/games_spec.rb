require 'rails_helper'

describe "Games API" do
  xit "should send back games with scores" do
    create_list(:game, 2)
    get '/api/v1/games'

    expect(response).to be_success
    games = JSON.parse(response.body)
    expect(games.count).to eq(2)
  end

  it "should send back one game" do
    games = create_list(:game, 2)
    plays = create_list(:play, 3, game: games.first)
    get "/api/v1/games/#{games.first.id}"

    game = JSON.parse(response.body)
    expect(game["id"]).to eq(games.first.id)
    expect(game["scores"]).to be_a Array
  end
end
