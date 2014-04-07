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

    @vote = @bookmark.votes.where(user_id: current_user.id).first
  end

  def update_vote(new_value)
    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, bookmark: @bookmark)
    end
  end
end