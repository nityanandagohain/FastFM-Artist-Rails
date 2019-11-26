require 'rails_helper'

RSpec.describe "FastfmHelper", type: :helper do
  let(:helpers) { Class.new { extend ArtistsHelper } }
  describe "FastfmHelper" do
      it "Get artist info from fastFM api" do
        res = {}
        res["artist"] = helpers.get_artist_info("Dire Straits")
        expect(res["artist"].key?("name")).to eq(true)
        expect(res["artist"].key?("stats")).to eq(true)
        expect(res["artist"].key?("stats")).to eq(true)
        expect(res["artist"]["name"]).to eq("Dire Straits")
      end
      it "Doesn't get artist info when name is empty" do
        res = {}
        res["artist"] = helpers.get_artist_info("")
        expect(res["artist"]).to eq(nil)
      end
      it "Get top tracks of the artist fastFM api" do
        res = {}
        res["toptracks"] = helpers.get_top_tracks("Dire Straits")
        expect(res["toptracks"]["track"].count).to eq(10)
      end
      it "Doesn't det top tracks of the artist fastFM api" do
        res = {}
        res["toptracks"] = helpers.get_top_tracks("")
        expect(res["toptracks"]).to eq(nil)
      end
  end
end
