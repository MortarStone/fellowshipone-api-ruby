module FellowshipOne

  class HouseholdReader < ApiReader

    # Constructor.
    #
    # @param household_id (optional) The ID of the household to load.
    def initialize(household_id = nil)
      if household_id.nil?
        @url_new_data_path = '/v1/Households/New'
      else
        @url_data_path = "/v1/Households/#{household_id}"
      end
    end
    
  end

end