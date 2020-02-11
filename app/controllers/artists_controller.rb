class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end
  
  def new
    @artists = Artist.new
    @artists.review.build
  end

  def create
    # byebug
     @artists = Artist.new(artist_params)
     @artists.user_id = session[:user_id]
     if @artists.save
         redirect_to artists_path(@artists)
     else
         render :new 
     end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    @artists = Artist.find(params[:id])
  end

  def update
      @artist = Artist.find(params[:id])
      @artist.update(params.require(:artist).permit(:name, :genre, :website, :description, :artist_id))
      redirect_to artists_path(@artists)
  end

private

  def artist_params
    params.require(:artist).permit(:name, :genre, :website, :description, :artist_id)
  end

end