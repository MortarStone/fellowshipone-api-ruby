module FellowshipOne

  class HouseholdListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :per_page - (optional) The number of items to return per page.
    # :household_id - The household ID to pull the info for.
    # :search_for - (optional) Search for name in the request.
    def initialize(options = {})
      raise 'Household ID not specified' if options[:household_id].nil? and options[:search_for].nil?
      
      page = options[:page] || 1
      @url_data_params = {}
      @url_data_path = options[:search_for].nil? ? "/v1/Households/#{options[:household_id].to_i}/People" : '/v1/Households/Search'

      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:recordsPerPage => per_page}) if per_page
      @url_data_params.merge!({:search_for => options[:search_for]}) if options[:search_for]      
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

