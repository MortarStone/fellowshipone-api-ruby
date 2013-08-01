module FellowshipOne

  class FundReader < ApiReader

    # Constructor.
    #
    # @param fund_id The ID of the fund to load.
    def initialize(fund_id)
      @url_data_path = "/giving/v1/funds/#{fund_id}"
    end
    
  end

end