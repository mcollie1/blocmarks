class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :bookmarks, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :urls, dependent: :destroy

  def role?(base_role)
    role == base_role.to_s
  end

  ROLES = %w[member moderator admin]
end
