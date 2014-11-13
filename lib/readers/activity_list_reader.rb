module FellowshipOne

  class ActivityListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/activities/v1/activities"
    end

  end

end