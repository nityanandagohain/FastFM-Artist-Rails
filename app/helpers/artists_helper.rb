require "uri"
require "json"

module ArtistsHelper
    Uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
    
    def get_artist_info(name)
        # Fetches the Aritst info
        # Params:
        # name : name of the artist
        # Returns:
        # A Ruby hash if successful else nil

        # query params for the api request
        params = { :format => 'json', :api_key => ENV["LASTFM_KEY"], :method => 'artist.getinfo', :artist => name }

        result = send_request(params)

        if result
            return result["artist"] 
        end

        # return nil if the API request was not successful
        return nil
    end

    def get_top_tracks(name)
        # Return the top tracks by the Aritst
        # Params:
        # name : name of the artist
        # Returns:
        # A Ruby hash if successful else nil

        # query params for the api request
        params = { :format => 'json', :api_key => ENV["LASTFM_KEY"], :method => 'artist.gettoptracks', :artist => name, :limit => 10 }

        result = send_request(params)

        if result
            return result["toptracks"] 
        end

        # return nil if the API request was not successful
        return nil
    end

    private

    def send_request(params)
        # sends request to the FastFm API
        # Params:
        # params : query parameters for the requets
        # Reutrns:
        # Response from the API is successful else nil

        Uri.query = URI.encode_www_form(params)

        begin
            res = Net::HTTP.get_response(Uri)
            if res.is_a?(Net::HTTPSuccess)
                data = JSON.parse(res.body)
                return data
            end
        rescue => exception
            puts "Exception Occured while fetching from API"
            puts exception.backtrace
        end

        return nil
    end

end
