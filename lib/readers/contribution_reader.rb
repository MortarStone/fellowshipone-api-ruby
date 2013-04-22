module FellowshipOne

  class ContributionReader < ApiReader

    # Constructor.
    #
    # <b>donation_id</b> The ID of the donation to load.
    # <b>CacheAdapter cacher</b> (optional) The cacher to be used to cache data.
    def initialize(contribution_id, cacher = nil)
      @url_data_path = "/giving/v1/contributionreceipts/#{contribution_id}"
    end
    
  end

end