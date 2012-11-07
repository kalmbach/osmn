module OSMN
  class Search < OSMN::Base

    def initialize(params)
      @params = {}
      self.params = params
    end

    def search
      if @params[:q]
        query = build_query(@params)

        uri = URI("http://nominatim.openstreetmap.org/search?#{query}")
        request = Net::HTTP::Get.new(uri.request_uri, initheader = {'Content-Type' => 'application/json'})
        response = Net::HTTP.start(uri.host, uri.port) {|http| http.request(request)}

        results = build_results(response.body) if response.code == '200'
      end
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
  end
end
