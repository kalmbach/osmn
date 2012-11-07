require 'osmn/base'
require 'osmn/search'
require 'osmn/reverse'
require 'osmn/version'
require 'osmn/hash'

module OSMN

  def self.search(q = nil, details = 0)
    search = Search.new(:q => q, :addressdetails => details)
    search.search
  end

  def self.reverse_geocode(lat = nil, lon = nil, details = 0)
    search = Reverse.new(:lat => lat, :lon => lon, :addressdetails => details)
    search.reverse_geocode
  end

end
