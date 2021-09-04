class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  def followings?(group_user)
    user.followings.include?(group_user)
  end

end
