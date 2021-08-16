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
    end 
    
    def destroy
    end 
   
   private
   def music_params
       params.require(:music).permit(:musicimage,:music_name,:music_caption,:music_url)
   end
end
