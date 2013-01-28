require 'open-uri'
require 'net/http'
require 'json'

module OSMN
  class Base

    def initialize(params)
      @params = {}
      self.params = params
    end

    def params=(value)
      if value.is_a? Hash
        value.each do |k,v|
          @params[k.to_sym] = v
        end
      end

      # We override the format because we expect a JSON response
      @params[:format] = :json
    end

    def params
      @params
    end

  private
    def request(action)
      query = build_query(@params)

      uri = URI("http://nominatim.openstreetmap.org/#{action.to_s}?#{query}")
      request = Net::HTTP::Get.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
      response = Net::HTTP.start(uri.host, uri.port) {|http| http.request(request)}

      results = build_results(response.body) if response.code == '200'
    end

    def build_query(params)
      query = params.map do |key, value|
        "#{key.to_s}=#{URI.escape(value.to_s)}" if value
      end.compact.join('&')
    end

    def build_results(response)
      parsed = JSON.parse(response)

      return case parsed
             when Hash then build_place(parsed)
             when Array then parsed.map{ |place| build_place(place) }
             end
    end

    def build_place(place)
      if place.is_a? Hash
        result = Result.new
        place.each {|k,v| result[k] = v }

        if place["address"].is_a? Hash
          result.address = Address.new
          place["address"].each{|k,v| result.address[k] = v }
        end

        result
      end
    end
  end
end
