class ShowsController < ApplicationController


  def tonight
    @shows = Show.all.where("date =?", Date.today)
  end

  def index
    @shows = Show.all.order(date: :asc)
  end

  def new
    @show = Show.new(artist_id: params[:artist_id])
    redirect_to shows_path unless @show.artist == current_artist

    @venue = Venue.new
  end

  def create
    @show = Show.new(show_params)
    redirect_to shows_path unless @show.artist == current_artist
    @show.venue = Venue.create(venue_params) unless @show.venue_id
    if @show.save
      redirect_to show_path(@show)
    else
      render :new
    end
  end

  def show
    @show = Show.find(params[:id])
  end

  def edit
    @show = Show.find(params[:id])
    redirect_to show_path(@show) unless @show.artist == current_artist
    @venue = @show.venue
  end

  def update
    @show = Show.find(params[:id])
    redirect_to show_path(@show) unless @show.artist == current_artist
    @show.update(show_params)
    @show.venue = Venue.create(venue_params) unless @show.venue_id
    if @show.save
      redirect_to show_path(@show)
    else
      render :edit
    end
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
