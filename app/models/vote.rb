class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
  belongs_to :url

  validates :value, inclusion: { in: [-1, 1], message: "%{value} is not a valid like." }

  def like_vote?
    value == 1
  end

  def unlike_vote?
    value == -1
  end

end
