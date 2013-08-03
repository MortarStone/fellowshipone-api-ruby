module FellowshipOne

  class HouseholdListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :filter - (optional) Filter options for the request.
    # :household_id - The household ID to pull the info for.
    def initialize(options = {})
      raise 'Household ID not specified' if options[:household_id].nil? and options[:url_data_path].nil?

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


######### This will be refactored later.


# # Constructor.
# #
# # Options:
# # :page - (optional) The page number to get.
# #
# # Only one of the optional parameters below can be specified.
# # :search_for - (optional) This parameter will be used as: parameter.searchfor like household.householdName.
# # :last_activity_date - (optional) This parameter will be used as: parameter.lastActivityDate >= household.lastActivityDate.
# # :last_updated_date - (optional) This parameter will be used as: parameter.lastUpdatedDate >= household.lastUpdatedDate.
# # :created_date - (optional) This parameter will be used as: parameter.createdDate >= household.createdDate.
# def initialize(options = {})
#   page = options[:page] || 1

#   @url_data_params = {:page => page}
#   @url_data_path = '/v1/Households/Search'

#   @url_data_params.merge!({:page => page}) if page
#   if options[:search_for]
#     @url_data_params.merge!({:searchfor => options[:search_for]})
#   elsif options[:last_activity_date]
#     @url_data_params.merge!({:lastActivityDate => options[:last_activity_date]})
#   elsif options[:last_updated_date]
#     @url_data_params.merge!({:lastUpdatedDate => options[:last_updated_date]})
#   elsif options[:created_date]
#     @url_data_params.merge!({:createdDate => options[:created_date]})
#   end
#   ....
# end

