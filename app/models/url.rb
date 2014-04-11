class Url < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
  has_many :votes, dependent: :destroy

  # after_create :create_vote

  private

  def create_vote
    user.votes.create(value: 1, url: self)
  end
end
