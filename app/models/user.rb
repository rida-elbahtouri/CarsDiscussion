class User < ApplicationRecord
    has_many :carsnews, foreign_key: 'author_id',class_name: 'Carsnew'

    has_many :followers,class_name:'Following',foreign_key:'follower_id'
    has_many :followeds,class_name:'Following',foreign_key:'followed_id'

    validates :username, presence: true, uniqueness: true
    validates :fullname, presence: true
end