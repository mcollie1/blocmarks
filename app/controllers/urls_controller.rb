class UrlsController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = @bookmark.urls.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = @bookmark.urls.find(params[:id])

    authorize @url
    if @url.destroy
      flash[:notice] = "The blocmark was deleted successfully."
      redirect_to bookmark_path
    else
      flash[:error] = "There was an error deleting the blocmark"
      render :show
    end
  end
end