class SearchController < ApplicationController

  def index
    @search = OxfordService.new(params[:q])
  end

end
