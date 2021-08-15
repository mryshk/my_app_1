class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  attachment :profile_image
  has_many :musics, dependent: :destroy
  has_many :musics_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
