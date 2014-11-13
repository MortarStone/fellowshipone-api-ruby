module FellowshipOne

  class ActivityReader < ApiReader

    # Constructor.
    #
    # @param fund_id The ID of the actvity to load.
    def initialize(activity_id)
      @url_data_path = "/activities/v1/activities/#{activity_id}"
    end
    
  end

end