class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :votes

  def like_votes
    self.votes.where(value: 1).count
  end

  def unlike_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.where(:value).count
  end
end
