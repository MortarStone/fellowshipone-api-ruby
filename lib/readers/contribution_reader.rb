module FellowshipOne

  class ContributionReader < ApiReader

    # Constructor.
    #
    # @param donation_id The ID of the contribution to load.
    def initialize(contribution_id)
      @url_data_path = "/giving/v1/contributionreceipts/#{contribution_id}"
    end
    
  end

end