module FellowshipOne

  class MemberHouseholdListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :filter - (optional) Filter options for the request.
    # :household_id - The household ID to pull the info for.
    def initialize(options = {})
      raise 'Household ID not specified' if options[:household_id].nil?

      page = options[:page] || 1
      filter = options[:filter]
      household_id = options[:household_id]

      @url_data_params = options[:url_data_params] || {}
      @url_data_path = options[:url_data_path] || "/v1/Households/#{household_id}/People"

      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:filter => filter}) if filter
    end

  end

end