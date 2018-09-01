class VenuesController < ApplicationController

  def show
    @venue = Venue.find(params[:id])
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def destroy
  end

end
