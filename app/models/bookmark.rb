class Bookmark < ActiveRecord::Base
  belongs_to :user
  has_many :votes, dependent: :destroy
  has_many :urls, dependent: :destroy

  default_scope { order('created_at DESC') }

  #validates :url, format: {with: Regexp.new(URI::regexp(%w(http https)))}, presence: true
  #validates :title, format: {with: Regexp.new(URI::regexp(['#']))}, presence: true
end
