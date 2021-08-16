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
    end

    def index
        @musics = Music.all
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

   private
   def music_params
       params.require(:music).permit(:musicimage,:music_name,:music_caption,:music_url)
   end
end
