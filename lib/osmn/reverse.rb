module OSMN
  class Reverse < OSMN::Base

    def initialize(params)
      @params = {}
      self.params = params
    end

    def reverse_geocode
      if @params[:lat] && @params[:lon]
        query = build_query(@params)

        uri = URI("http://nominatim.openstreetmap.org/reverse?#{query}")
        request = Net::HTTP::Get.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
        response = Net::HTTP.start(uri.host, uri.port) {|http| http.request(request)}

        results = build_results(response.body) if response.code == '200'
      end
    end

    def params=(value)
      if value.is_a? Hash
        value.each do |k,v|
          @params[k.to_sym] = v unless v.nil?
        end
      end

      # We override the format because we expect a JSON response
      @params[:format] = :json
    end

    def params
      @params
    end
  end
end
