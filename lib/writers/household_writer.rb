module FellowshipOne

  class HouseholdWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/v1/Households/#{data[:id]}"
      else
        @url_action = :post
        @url_data_path = "/v1/Households"
      end
      @url_data_delete_path = "/v1/Households/#{data[:id]}"

      @url_data_params = {:household => data}

      @updatable_fields = [:oldID,
                           :hCode,
                           :householdName,
                           :householdSortName,
                           :householdFirstName,
                           :lastSecurityAuthorization]
    end
    
  end

end