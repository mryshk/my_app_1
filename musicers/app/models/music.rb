class Music < ApplicationRecord
    
    attachment :musicimage
    belongs_to :user
    
end
