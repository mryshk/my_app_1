class Group < ApplicationRecord
  has_many :group_users
  has_many :users ,through: :group_users
  validates :name, presence: true ,uniqueness: true

  attachment :image
  
  def joined_by?(user)
    group_users.where(user_id: user.id).exists?
  end
  
  
  
end
