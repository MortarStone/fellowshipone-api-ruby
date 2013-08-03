module FellowshipOne

  class HouseholdListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.
    #
    # Only one of the optional parameters below can be specified.
    # :search_for - (optional) This parameter will be used as: parameter.searchfor like household.householdName.
    # :last_activity_date - (optional) This parameter will be used as: parameter.lastActivityDate >= household.lastActivityDate.
    # :last_updated_date - (optional) This parameter will be used as: parameter.lastUpdatedDate >= household.lastUpdatedDate.
    # :created_date - (optional) This parameter will be used as: parameter.createdDate >= household.createdDate.
    def initialize(options = {})
      page = options[:page] || 1

      @url_data_params = options[:url_data_params] || {}
      @url_data_path = options[:url_data_path] || "/v1/Households/People"

      @url_data_params.merge!({:page => page}) if page
      if options[:search_for]
        @url_data_params.merge!({:searchfor => options[:search_for]})
      elsif options[:last_activity_date]
        @url_data_params.merge!({:lastActivityDate => options[:last_activity_date]})
      elsif options[:last_updated_date]
        @url_data_params.merge!({:lastUpdatedDate => options[:last_updated_date]})
      elsif options[:created_date]
        @url_data_params.merge!({:createdDate => options[:created_date]})
      end
    end

  end

end