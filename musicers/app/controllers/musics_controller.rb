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
        @music_comment_n = MusicComment.new
        @comments = @music.music_comments
        @average_rate = @comments.average(:post_rate)
    end

    def index
        @musics = Music.page(params[:page]).reverse_order
        @comments = @musics.music_comments
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
        @search = Music.search(params[:keyword]).page(params[:page]).reverse_order
        @keyword = params[:keyword]
        render "search"
    end

    def search_genre
        @search = Music.ransack(params[:q])
        @musics = @search.result
        render "index"
    end

    def home
        @musics = Music.where(user_id:[current_user,*current_user.following_ids]).page(params[:page]).reverse_order
    end

    def index_new_date
        @musics = Music.order("created_at DESC").page(params[:page])
        render "index"
    end

    def index_rate_desc
        @musics = Music.order(rate: :desc).page(params[:page])
        render "index"
    end

   private
   def music_params
       params.require(:music).permit(:musicimage,:music_name,:artist_name,:music_caption,:music_url,:music_genre)
   end
end
