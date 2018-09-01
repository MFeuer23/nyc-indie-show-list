class ShowsController < ApplicationController

  def index
    @shows = Show.all.order(date: :asc)
  end

  def new
      @show = Show.new(artist_id: params[:artist_id])
  end

  def create

    @show = Show.new(show_params)
    if @show.venue_id
      @show.save
    else
      @venue = Venue.create(venue_params)
      @show.venue_id = @venue.id
      @show.save
    end
    redirect_to show_path(@show)
  end

  def show
    @show = Show.find(params[:id])
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    @show.update(show_params)

    if @show.venue_id
      @show.save
    else
      @venue = Venue.create(venue_params)
      @show.venue_id = @venue.id
      @show.save
    end
    redirect_to show_path(@show)
  end

  def destroy

    @show = Show.find(params[:id])
    @artist = @show.artist
    @show.destroy
    redirect_to artist_path(@artist)
  end

  private

  def show_params
    params.require(:show).permit(:artist_id, :info, :date, :venue_id)
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :contact)
  end
end
