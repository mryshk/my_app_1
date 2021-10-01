class HomesController < ApplicationController

    def top
        @musics = Music.all
    end

end
