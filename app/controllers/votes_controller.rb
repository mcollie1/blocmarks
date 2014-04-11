class VotesController < ApplicationController
  before_filter :setup

  def like_vote
    update_vote(1)
    redirect_to :back
  end

  def unlike_vote
    update_vote(-1)
    redirect_to :back
  end

  private

  def setup
    @bookmark = Bookmark.find(params[:bookmark_id])
    @url = @bookmark.urls.find(params[:url_id])

    @vote = @url.votes.where(user_id: current_user.id).first
  end

  def update_vote(new_value)
    if @vote
      authorize @vote, :update?
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.build(value: new_value, url: @url)
      authorize @vote, :create?
      @vote.save
    end
  end
end