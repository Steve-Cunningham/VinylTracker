class AlbumsController < ApplicationController
  before_filter :authenticate_user!

    def index
      @albums = current_user.albums.all
      @album = Album.new
    end

    def new
        @album = Album.new
    end

    def create
      @albums = current_user.albums.all
      @album = current_user.albums.build(params[:album])
      if @album.save
        flash[:notice] = "#{@album.title} has been added to your shelf."
        redirect_to albums_path
      else
        render :index
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to albums_path
    end

end