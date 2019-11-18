require "net/http"
require "json"

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

        @artist_details = get_artist_details(@artist.name)

        render "result"
    end

    def get_artist_details(name)
        # get artist info
        result = {}
        url = URI.parse("http://ws.audioscrobbler.com/2.0/?format=json&api_key=#{ENV["LASTFM_KEY"]}&method=artist.getInfo&artist=#{name}")
        res = Net::HTTP.start(url.host, url.port) { |http|
            http.request(Net::HTTP::Get.new(url.to_s))
        }
        data = JSON.parse(res.body)
        result["artist"] = data["artist"]

        # get top tracks of the artist
        url = URI.parse("http://ws.audioscrobbler.com/2.0/?format=json&api_key=#{ENV["LASTFM_KEY"]}&method=artist.gettoptracks&artist=#{name}&limit=10")
        res = Net::HTTP.start(url.host, url.port) { |http|
            http.request(Net::HTTP::Get.new(url.to_s))
        }
        data = JSON.parse(res.body)
        result["toptracks"] = data["toptracks"]
        # puts result["toptracks"]
        return result
    end

    
    private
        def post_params
            params.require(:artist).permit(:name)
        end
end
