class SearchController < ApplicationController

  def index
    @search = OxfordService.new(params[:q])
    # binding.pry
  end

end
