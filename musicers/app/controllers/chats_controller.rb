class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)


    user_rooms = UserRoom.find_by()

  end

  def create


  end


end
