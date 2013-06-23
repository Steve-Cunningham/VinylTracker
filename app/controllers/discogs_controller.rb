require 'discogs'

class DiscogsController < ApplicationController

    wrapper = Discogs::Wrapper.new("VinylTracker")

    def callback
      @discog = Discogs::Wrapper.new("GUSwPzlueIDPdoFRrwkC")
    end

end