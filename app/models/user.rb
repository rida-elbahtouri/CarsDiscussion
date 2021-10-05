class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :thoughts, foreign_key: 'author_id'

  has_many :followers_group, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followeds_group, class_name: 'Following', foreign_key: 'followed_id'

  has_many :followers, through: :followeds_group, foreign_key: 'followed_id'
  has_many :followeds, -> { order(created_at: :desc) }, through: :followers_group, foreign_key: 'follower_id'


  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true, length: { minimum: 3, maximum: 30 }

  def whotofollow
    User.where.not(id: followeds.pluck(:id).push(id)).order(created_at: :desc)
  end

  def followedthought
    followeds = self.followeds.pluck(:id).push(id)
    Thought.where(author_id: followeds).ordered_by_most_recent.includes(:author)
  end
end
