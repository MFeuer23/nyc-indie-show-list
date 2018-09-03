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

    @shows.each do |show|
      if show.date >= Date.today
        @upcoming << show
      else
        @past << show
      end
    end

    @venues = @artist.venues.order(name: :asc).uniq
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
    params.require(:artist).permit(:name, :bio, :genre, :image)
  end


end
