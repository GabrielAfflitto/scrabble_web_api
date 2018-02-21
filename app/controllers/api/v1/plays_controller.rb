class Api::V1::PlaysController < ApplicationController

  def create
    # binding.pry
    render json: Play.create(play_params)
  end

  private

    def play_params
      params.permit(:user_id, :word, :game_id)
    end

end
