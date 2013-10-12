module FellowshipOne

  class ContributionWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/giving/v1/contributionreceipts/#{data[:id]}"
      else
        @url_action = :post
        @url_data_path = "/giving/v1/contributionreceipts"
      end
      @url_data_delete_path = "/giving/v1/contributionreceipts/#{data[:id]}"

      @url_data_params = @url_data_params = {:contributionReceipt => data}

      @updatable_fields = [:amount,
                           :fund,              #required
                           :received_date,     #required
                           :contribution_type] #required
    end
    
  end

end