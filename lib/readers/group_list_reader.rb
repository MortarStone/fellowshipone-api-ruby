module FellowshipOne

  class GroupListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      page = options[:page] || 1
      per_page = options[:per_page] || 50

      @url_data_params = {}
      @url_data_params.merge!({page: page}) if page
      @url_data_params.merge!({pageSize: per_page}) if per_page   
      @url_data_path = options[:url_data_path] || "/activities/v1/typegroups"
    end

  end

end