class ArtistsController < ApplicationController

  def show
    @artist = Artist.find(params[:id])
  end

  def new 
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(post_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.update(post_params(:name,:bio))
    redirect_to
  end

  private

  def post_params(*args)
    params.require(:artist).permit(*args)
  end

end