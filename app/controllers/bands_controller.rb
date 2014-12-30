class BandsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def show
    @band = Band.find(params[:id])
    @band_post = BandPost.new
  end

  def new
    @band = Band.new
    @genre_list = GenreList.new
  end

  def create
    binding.pry
    @user = User.find(current_user.id)
    @band = Band.create(band_params)
    if @band.save
      flash[:notice] = "Band created!"
      redirect_to user_path(@user)
    else
      render "new"
    end
  end

  private

  def band_params
    band_params = params.require(:band).permit(:name)
    band_params[:user_id] = current_user.id
    band_params
  end
end
