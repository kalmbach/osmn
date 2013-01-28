module OSMN
  class Reverse < OSMN::Base

    def reverse_geocode
      request(:reverse) if @params[:lat] && @params[:lon]
    end
  end
end
