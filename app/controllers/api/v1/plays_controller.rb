class Api::V1::PlaysController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @play = @game.plays.create(play_params)
    OxfordService.new(play_params[:word]).get_word

    if @play.save
      render json: @game.plays.last
    else
      {message: "#{params[:word]} is not valid"}
    end
  end

  private

    def play_params
      params.require(:play).permit(:user_id, :word)
    end

end
