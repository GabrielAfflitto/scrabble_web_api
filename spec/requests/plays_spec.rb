require 'rails_helper'


describe "Plays API" do
  it "should be able to create new plays" do
    game = create(:game)
    play_params = {user_id: "1", word: "at"}
    post "/api/v1/games/#{game.id}/plays", params: {play: play_params}

    new_play = Play.last
    # binding.pry
    expect(response.status).to eq(201)
    expect(play.word).to eq(play_params[:word])
  end
end
