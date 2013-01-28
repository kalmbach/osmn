module OSMN
  class Search < OSMN::Base

    def search
      request(:search) if @params[:q]
    end
  end
end
