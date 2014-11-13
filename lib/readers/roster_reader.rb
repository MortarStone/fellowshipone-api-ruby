module FellowshipOne

  class RosterReader < ApiReader

    # Constructor.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param roster_id The ID of the roster folder to load.
    def initialize(activity_id, roster_id)
      @url_data_path = "/activities/v1/activities/#{activity_id}/rosters/#{roster_id}"
    end
    
  end

end