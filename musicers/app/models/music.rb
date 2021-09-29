class Music < ApplicationRecord

    attachment :musicimage
    belongs_to :user
    has_many :music_comments ,dependent: :destroy
    has_many :favorites ,dependent: :destroy

    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    
    def self.search(keyword)
      where(["music_name like? OR music_genre like?","%#{keyword}%","%#{keyword}%" ])
    end
    

end
