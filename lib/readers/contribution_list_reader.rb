module FellowshipOne

  class ContributionListReader < ApiReader

    # Constructor.
    #
    # @param page (optional) The page number to get.
    # @param options A hash of options for requesting data from the server.
    def initialize(options = {})
      page = options[:page] || 1
      filter = options[:filter]

      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/giving/v1/contributionreceipts"
            
      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:filter => filter}) if filter

      # The object to store and load the cache.
      @cacher = cacher unless cacher.nil?
    end

  end

end