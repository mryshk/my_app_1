class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :reverse_of_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  has_many :followers, through: :reverse_of_relationship,source: :followers
  
  has_many :relationships, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  has_many :followings ,through: :relationships, source: :followed
  
  
  attachment :profile_image
  has_many :musics, dependent: :destroy
  has_many :music_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
