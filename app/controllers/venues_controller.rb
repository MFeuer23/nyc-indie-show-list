class VenuesController < ApplicationController

  def index
    @venues = Venue.all.order(name: :asc)
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to venue_path(@venue)
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
