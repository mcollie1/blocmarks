class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    authorize @bookmarks
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
  end

  def edit
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    url = @bookmark.url

    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "\"#{url}\" was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the topic"
      render :show
    end
  end
end
