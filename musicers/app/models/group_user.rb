class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  has_many :followings ,through: :relationships, source: :followed

  def follow?(user)
    followings.where(followed_id: user.id).exists?
  end

 

end
