class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(name: :asc)
  end

  def show
    @venue = Venue.find(params[:id])
    @shows = @venue.shows.order(date: :asc)
    @past = []
    @upcoming = []

    @shows.each do |show|
      if show.date >= Date.today
        @upcoming << show
      else
        @past << show
      end
    end

    @artists = @venue.artists
  end

  def edit
    @venue = Venue.find(params[:id])

  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update(venue_params)
      redirect_to venue_path(@venue)
    else
      render :edit
    end
  end

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to artist_path(current_artist)
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :contact)
  end

end
