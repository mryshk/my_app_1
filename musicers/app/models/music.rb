class Music < ApplicationRecord

    attachment :musicimage
    belongs_to :user
    has_many :music_comments ,dependent: :destroy
    has_many :favorites ,dependent: :destroy

end
