class AlbumsController < ApplicationController
  before_filter :authenticate_user!

    def index
        @albums = Album.all
    end

    def new
        @album = Album.new
    end

    def create
      @album = Album.create ( params[:album] )
      flash[:notice] = "Album added"
      redirect_to :root
    end

    def destroy
      @album = Album.find( params[:album] )
      @album = Album.destroy
    end

end