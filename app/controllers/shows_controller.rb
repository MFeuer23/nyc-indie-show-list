class ShowsController < ApplicationController

  def index
    if params[:artist_id]
      @shows = Artist.find(params[:artist_id]).shows
    else
      @shows = Show.all
    end
  end

  def new
      @show = Show.new(artist_id: params[:artist_id])
  end

  def create
    #params: {"utf8"=>"✓", "authenticity_token"=>"1AaXo9FRdu25OcwBenmjqh5s4p0qkLXn9MO1E8ua7urwQahtY9aA7HTgnVu3YAmdFsctGI0J5/uQwEmiaYcs4A==", "show"=>{"artist_id"=>"6", "date"=>"12/26/2018", "info"=>"best show ever", "venue_id"=>"1"}, "venue"=>{"name"=>"pianos", "address"=>"ludlow st", "contact"=>"pianosnyc@pianos.com"}, "commit"=>"Create Show", "controller"=>"shows", "action"=>"create"} permitted: false>
  end


  private

  def song_params
    params.require(:song).permit(:artist_id, :date, :info, :venue_id, :venue)
  end
end
