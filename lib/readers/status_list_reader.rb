module FellowshipOne

  class StatusListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/v1/People/Statuses"
    end

  end

end