class User < ApplicationRecord
    has_many :thoughts, foreign_key: 'author_id',class_name: 'Thought'

    has_many :followers_group,class_name:'Following',foreign_key:'follower_id'
    has_many :followeds_group,class_name:'Following',foreign_key:'followed_id'

    has_many :followers ,through: :followeds_group,foreign_key: 'followed_id'
    has_many :followeds, -> { order(created_at: :desc)},through: :followers_group,foreign_key: 'follower_id'

    has_one_attached :photo
    has_one_attached :cover_image

    validates :username, presence: true, uniqueness: true
    validates :fullname, presence: true


    def whotofollow
        people = User.where.not(id: self.followeds.pluck(:id).push(self.id)).order(created_at: :desc)
    end
end
