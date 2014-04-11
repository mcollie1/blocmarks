class UrlsController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = Url.find(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = Url.find(params[:id])

    authorize @url
    if @url.destroy
      flash[:notice] = "The blocmark was deleted successfully."
      redirect_to user_path(current_user)
    else
      flash[:error] = "There was an error deleting the blocmark"
      render :show
    end
  end
end