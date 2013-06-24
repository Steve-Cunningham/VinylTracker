require 'discogs'

class DiscogsController < ApplicationController

    wrapper = Discogs::Wrapper.new("VinylTracker")

    def callback
      @discog = Discogs::Wrapper.new("GUSwPzlueIDPdoFRrwkC")
    end

    def search
      artist = wrapper.get_artist( params[:discogs_search_artist] )
    end

end