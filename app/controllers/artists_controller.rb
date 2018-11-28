class ArtistsController < ApplicationController

  def rock
    @artists = Artist.rock
  end

  def index
    @artists = Artist.all.order(name: :asc)
  end

  def search
    @artist = Artist.search(params[:name])
  end

  def show
    @artist = Artist.find(params[:id])
    @shows = @artist.shows.order(date: :asc)
    @upcoming = Show.upcoming(@shows)
    @past = Show.past(@shows)
    @venues = @artist.venues.order(name: :asc).uniq
    @show = Show.new
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @artist, status: 200}
    end
  end

  def edit
    @artist = Artist.find(params[:id])
    redirect_to artist_path(@artist) unless @artist == current_artist
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(artist_params) if @artist == current_artist
    redirect_to artist_path(@artist)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :genre, :image)
  end
end
