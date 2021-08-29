class MusicsController < ApplicationController
    def  new
        @music = Music.new
    end

    def create
        @music = Music.new(music_params)
        @music.user_id = current_user.id
        @music.save
        redirect_to music_path(@music)
    end

    def show
        @music = Music.find(params[:id])
        @comments = @music.music_comments
    end

    def index
        @musics = Music.page(params[:page]).reverse_order
    end

    def edit
        @music = Music.find(params[:id])
    end

    def update
        @music = Music.find(params[:id])
        @music.user_id = current_user.id
        @music.update(music_params)
        redirect_to music_path(@music)
    end

    def destroy
        @music = Music.find(params[:id])
        @music.destroy
        redirect_to musics_path
    end

    def search
        @musics = Music.search(params[:keyword])
        @keyword = params[:keyword]
        render "search"
    end

    def home
        @musics = Music.where(user_id:[current_user,*current_user.following_ids]).page(params[:page]).reverse_order
    end

   private
   def music_params
       params.require(:music).permit(:musicimage,:music_name,:music_caption,:music_url,:music_genre)
   end
end
