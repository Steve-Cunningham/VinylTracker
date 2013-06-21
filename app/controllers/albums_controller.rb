class AlbumsController < ApplicationController
  before_filter :authenticate_user!

    def index

      if params[:search].blank?
        @albums = current_user.albums.all
      else
        @albums = current_user.albums.search_by(params[:search])
      end
    end

    def new
        @album = Album.new
    end

    def create
      @albums = current_user.albums.all
      @album = current_user.albums.build(params[:album])
      if @album.save
        redirect_to albums_path
        flash[:notice] = "#{@album.title} has been added to your shelf."
      else
        render :index
      end
    end

    def edit
      @album = Album.find(params[:id])
      redirect_to edit_album_path(album)
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      if @album.destroyed?
        redirect_to albums_path
        flash[:notice] = "Album deleted"
      else 
        render :index
      end
    end

end