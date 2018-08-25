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

    @show = Show.new(show_params)
    @show.date = Date.parse("#{params.require(:show).permit(:date)}")
    if @show.venue_id
      @show.save
    else
      @venue = Venue.create(venue_params)
      @show.venue_id = @venue_id
      @show.save
    end
    redirect_to show_path(@show)
  end


  private

  def show_params
    params.require(:show).permit(:artist_id, :info, :date, :venue_id)
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :contact)
  end
end
