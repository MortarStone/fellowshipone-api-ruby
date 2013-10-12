module FellowshipOne

  class ContributionReader < ApiReader

    # Constructor.
    #
    # @param contribution_id (optional) The ID of the contribution to load.
    def initialize(contribution_id = nil)
      if contribution_id.nil?
        @url_new_data_path = '/giving/v1/contributionreceipts/new'
      else
        @url_data_path = "/giving/v1/contributionreceipts/#{contribution_id}"
      end      
    end
    
  end

end