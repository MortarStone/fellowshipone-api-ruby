module FellowshipOne

  class HouseholdListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :filter - (optional) Filter options for the request.
    def initialize(options = {})
      page = options[:page] || 1
      filter = options[:filter]

      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/v1/Households"

      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:filter => filter}) if filter
    end

  end

end