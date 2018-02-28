class Api::V1::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @game = Game.find(params[:game_id])
    @play = @game.plays.new(play_params)
    if OxfordService.new.validate_word(params[:word])
      @play.save
      render json: @game.plays.last
    else
      render json: { message: "#{params[:word]} is not a valid word" }
    end
  end

  private

    def play_params
      params.permit(:user_id, :word)
    end

end
