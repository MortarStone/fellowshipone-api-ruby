module FellowshipOne

  class TypeListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      raise 'type_group_id not specified' if options[:type_group_id].nil?

      type_group_id = options[:type_group_id]
      page = options[:page] || 1
      per_page = options[:per_page] || 50

      @url_data_params = {}
      @url_data_params.merge!({page: page}) if page
      @url_data_params.merge!({pageSize: per_page}) if per_page   
      @url_data_path = options[:url_data_path] || "/activities/v1/typegroups/#{type_group_id}/types"
    end

  end

end