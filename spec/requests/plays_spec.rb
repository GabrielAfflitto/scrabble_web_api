require 'rails_helper'


describe "Plays API" do
  it "should be able to create new plays" do
    play_params = {user_id: "1", word: "at"}
    post "/api/v1/games/1/plays", params: {play: play_params}

    play = Play.last
    # binding.pry
    expect(response.status).to eq(201)
    expect(play.word).to eq(play_params[:word])
  end
end
