require 'rails_helper'

RSpec.describe "FastfmHelper", type: :helper do
  let(:helpers) { Class.new { extend ArtistsHelper } }
  describe "FastfmHelper" do
      it "Get artist info from fastFM api" do
        res = {}
        uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
        res["artist"] = helpers.getArtistInfo(uri , "Dire Straits")
        expect(res["artist"].key?("name")).to eq(true)
        expect(res["artist"].key?("stats")).to eq(true)
        expect(res["artist"].key?("stats")).to eq(true)
        expect(res["artist"]["name"]).to eq("Dire Straits")
      end
      it "Doesn't get artist info when name is empty" do
        res = {}
        uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
        res["artist"] = helpers.getArtistInfo(uri , "")
        expect(res["artist"]).to eq(nil)
      end
      it "Get top tracks of the artist fastFM api" do
        res = {}
        uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
        res["toptracks"] = helpers.getTopTracks(uri , "Dire Straits")
        expect(res["toptracks"]["track"].count).to eq(10)
      end
      it "Doesn't det top tracks of the artist fastFM api" do
        res = {}
        uri = URI.parse("http://ws.audioscrobbler.com/2.0/")
        res["toptracks"] = helpers.getTopTracks(uri , "")
        expect(res["toptracks"]).to eq(nil)
      end
  end
end
