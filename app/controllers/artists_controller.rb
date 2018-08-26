class ArtistsController < ApplicationController

  def index
  end

  def show
    @artist = Artist.find(params[:id])
    @shows = @artist.shows.order(date: :asc)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :genre)
  end


end
