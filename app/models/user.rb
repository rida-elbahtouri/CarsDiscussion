class User < ApplicationRecord
    has_many :thoughts, foreign_key: 'author_id',class_name: 'Thought'

    has_many :followers,class_name:'Following',foreign_key:'follower_id'
    has_many :followeds,class_name:'Following',foreign_key:'followed_id'

    has_one_attached :photo
    has_one_attached :cover_image

    validates :username, presence: true, uniqueness: true
    validates :fullname, presence: true


    def whotofollow
        people = User.where.not(id: self.followers.pluck(:followed_id).push(self.id)).order(created_at: :desc)
    end
    def followedby
        people = User.where(id: self.followeds.pluck(:follower_id)).order(created_at: :desc)
    end
end
