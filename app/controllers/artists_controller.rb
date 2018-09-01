class ArtistsController < ApplicationController

  def index
  end

  def search

    @artist = Artist.all.collect do |artist|
      if artist.name.downcase.include?(params[:name].downcase)
        artist
      end

    end
  end

  def show
    @artist = Artist.find(params[:id])
    @shows = @artist.shows.order(date: :asc)
    @past = []
    @upcoming = []
    @artist.shows.each do |show|
      if show.date < Date.today
        @past << show
      else
        @upcoming << show
      end
    end
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
