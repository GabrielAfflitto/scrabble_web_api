class SearchController < ApplicationController

  def index
    @word = Word.new(params[:q])
  end

end
