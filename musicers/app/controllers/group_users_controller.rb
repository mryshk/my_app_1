class GroupUsersController < ApplicationController

  def create
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.new(group_id: @group.id)
    @group_user.user_id = current_user.id
    @group_user.save
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    @group_user = GroupUser.find_by(group_id: @group.id, user_id: current_user.id)
    @group_user.destroy
    redirect_to group_path(@group)
  end


  def index
    @group = Group.find(params[:group_id])
    @group_users = @group.group_users
    @group_follows = GroupUser.joins(user: :followings).where(user_id: current_user)
    
  end

end
