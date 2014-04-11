class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :urls, dependent: :destroy

  def like_votes
    self.votes.where(value: 1).count
  end

  def unlike_votes
    self.votes.where(value: -1).count
  end

  def points
    self.votes.where(:value).count
  end

  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
