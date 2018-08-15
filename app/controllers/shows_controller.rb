class ShowsController < ApplicationController

  def index
    if params[:artist_id]
      @shows = Artist.find(params[:artist_id]).shows
    else
      @shows = Show.all
    end
  end

  def new
  end

end
