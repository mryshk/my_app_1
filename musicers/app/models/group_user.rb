class GroupUser < ApplicationRecord
  belongs_to :group
  belongs_to :user

  attachment :image
end
