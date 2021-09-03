class GroupsController < ApplicationController
  def new
    @group = Group.new
    @group.users << current_user

  end

  def create
    @group = Group.new(group_params)
     binding.pry
    if @group.save
      redirect_to musics_path
    else
      render :new
    end

  end

  def show
    @group = Group.find(params[:id])
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    @group.update(group_params)
    redirect_to groups_path
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private
  def group_params
    params.require(:group).permit(:name,:introduction,:image)
  end

end
