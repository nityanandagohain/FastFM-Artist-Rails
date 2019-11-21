require "uri"
require "json"

module ArtistsHelper
    def getArtistInfo(uri, name)
        # query params for the api request
        params = { :format => 'json', :api_key => ENV["LASTFM_KEY"],:method => 'artist.getinfo', :artist => name }
        uri.query = URI.encode_www_form(params)
        begin
            res = Net::HTTP.get_response(uri)
            if res.is_a?(Net::HTTPSuccess)
                data = JSON.parse(res.body)
                return data["artist"]
            end
        rescue => exception
            puts "Exception Occured while fetching from API"
            puts exception.backtrace
        end
        return nil
    end

    def getTopTracks(uri, name)
        # query params for the api request
        params = { :format => 'json', :api_key => ENV["LASTFM_KEY"],:method => 'artist.gettoptracks', :artist => name, :limit => 10 }
        uri.query = URI.encode_www_form(params)
        begin
            res = Net::HTTP.get_response(uri)
            if res.is_a?(Net::HTTPSuccess)
                data = JSON.parse(res.body)
                return data["toptracks"] 
            end
        rescue => exception
            puts "Exception Occured while fetching from API"
            puts exception.backtrace
        end
        return nil
    end
end
