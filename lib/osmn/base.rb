require 'open-uri'
require 'net/http'
require 'json'

module OSMN
  class Base

  private
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
        result = place.to_struct('Result')
        if result.respond_to?('address')
          result.address = result.address.to_struct('Address')
        end

        result
      end
    end
  end
end
