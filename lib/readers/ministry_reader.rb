module FellowshipOne

  class MinistryReader < ApiReader

    # Constructor.
    #
    # @param ministry_id The ID of the type group to load.
    def initialize(ministry_id)
      @url_data_path = "/activities/v1/ministries/#{ministry_id}"
    end
    
  end

end