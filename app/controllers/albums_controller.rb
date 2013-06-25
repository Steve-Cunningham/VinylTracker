class AlbumsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

    def index

      if params[:search].blank?
        @albums = current_user.albums.order(sort_column + " " + sort_direction)
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
    end

    def update
      @album = Album.find(params[:id])

      if @album.update_attributes(params[:album])
        redirect_to(albums_path,
                  :notice => 'Album was successfully updated.')
      else
        flash[:notice].now = "Changes not saved"
        render :action => "edit"
      end
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

  private

    def sort_column
    Album.column_names.include?(params[:sort]) ? params[:sort] : "artist"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end