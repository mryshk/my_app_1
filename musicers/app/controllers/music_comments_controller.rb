class MusicCommentsController < ApplicationController

  def new
    @music_comment = MusicComment.new
  end


  def create
    @music = Music.find(params[:music_id])
    @comment = MusicComment.new(music_comment_params)
    @comment.user_id = current_user.id
    @comment.music_id = @music.id
    @comment.save
    redirect_to music_path(@music)
  end

  def edit
      @comment = MusicComment.find_by(id: params[:id])
  end

  def update
    @comment = MusicComment.find_by(id: params[:id])
    @comment.user_id = current_user.id
    @comment.update(music_comment_params)
    redirect_to music_path(@comment.music)
  end
  def destroy
    @comment = MusicComment.find_by(id: params[:id],music_id: params[:music_id])
    @comment.destroy
    redirect_to music_path(params[:music_id])
  end

private
  def music_comment_params
    params.require(:music_comment).permit(:comment)
  end

end
