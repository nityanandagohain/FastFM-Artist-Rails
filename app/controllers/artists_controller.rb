class ArtistsController < ApplicationController
    before_action :authorize, only: [:create, :index, :new]

    def index
        @artist = Artist.new
        user = User.find_by_id(current_user.id)
        @previous_artists =  user.artists
    end

    def create
        @artist = Artist.new(post_params)
        user = User.find_by_id(current_user.id)
        if not user.artists.exists? name: @artist.name
            user.artists << @artist
        else            
            puts "already present in database"
        end
    end

    
    private
        def post_params
            params.require(:artist).permit(:name)
        end
end
