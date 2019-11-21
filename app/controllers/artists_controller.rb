require "net/http"
require "json"

class ArtistsController < ApplicationController
    include ArtistsHelper
    before_action :authorize, only: [:create, :index, :new]
    Uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
    
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

        @artist_details = {}
        @artist_details["artist"] = helpers.getArtistInfo(Uri, @artist.name)
        @artist_details["toptracks"] = helpers.getTopTracks(Uri, @artist.name)

        render "result"
    end

    
    private
        def post_params
            params.require(:artist).permit(:name)
        end
end
