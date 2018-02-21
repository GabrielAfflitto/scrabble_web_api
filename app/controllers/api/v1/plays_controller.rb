class Api::V1::PlaysController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @play = @game.plays.create(play_params)

    if @play.save
      render json: @game.plays.last
    else
      {message: "word is not valid"}
    end
  end

  private

    def play_params
      params.require(:play).permit(:user_id, :word)
    end

end
