class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
    @urls = Url.all
    authorize @bookmarks
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @urls = @bookmark.urls
  end

  def new
  end

  def edit
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = @bookmark.urls.find(params[:id])
    url_name = @url.url

    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "\"#{@url.url}\" was deleted successfully."
      redirect_to bookmarks_path
    else
      flash[:error] = "There was an error deleting the topic"
      render :show
    end
  end
end
