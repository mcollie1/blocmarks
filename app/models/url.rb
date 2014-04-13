class Url < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
  has_many :votes, dependent: :destroy

  # after_create :create_vote

  def like_votes
    self.votes.where(value: 1).count
  end

  def unlike_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.sum(:value).to_i
  end

  private

  def create_vote
    user.votes.create(value: 1, url: self)
  end
end
