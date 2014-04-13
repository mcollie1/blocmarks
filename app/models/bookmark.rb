class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :urls, dependent: :destroy

  validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
end
