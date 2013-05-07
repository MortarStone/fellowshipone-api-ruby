module FellowshipOne

  class HouseholdReader < ApiReader

    # Constructor.
    #
    # @param household_id The ID of the household to load.
    def initialize(household_id)
      @url_data_path = "/v1/Households/#{household_id}"
    end
    
  end

end