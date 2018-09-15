class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(name: :asc)
  end

  def new
    redirect_to venues_path unless artist_signed_in?
    @venue = Venue.new
  end

  def create
    redirect_to venues_path unless artist_signed_in?
    @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to venue_path(@venue)
    else
      render :new
    end
  end

  def show
    @venue = Venue.find(params[:id])
    @shows = @venue.shows.order(date: :asc)
    @upcoming = Show.upcoming(@shows)
    @past = Show.past(@shows)
    @artists = @venue.artists
  end

  def edit
    @venue = Venue.find(params[:id])
    redirect_to venue_path(@venue) unless artist_signed_in?
  end

  def update
    redirect_to venue_path(@venue) unless artist_signed_in?
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
