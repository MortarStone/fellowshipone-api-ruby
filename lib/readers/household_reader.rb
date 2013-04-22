module FellowshipOne

  class HouseholdReader < ApiReader

    # Constructor.
    #
    # @param person_id The ID of the user to load.
    def initialize(household_id)
      @url_data_path = "/v1/Households/#{household_id}"
    end
    
  end

end