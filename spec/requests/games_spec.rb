require 'rails_helper'

describe "Games API" do
  it "should send back games with scores" do
    create_list(:game, 2)
    get '/api/v1/games'

    expect(response).to be_success
    games = JSON.parse(response.body)
    expect(games.count).to eq(2)
  end

  it "should send back one game" do
    games = create_list(:game, 2)
    get '/api/v1/games/1'

    game = JSON.parse(response.body)
    expect(game["id"]).to eq(items.first.id)
    expect(game["scores"]).to be_a Array
  end
end
