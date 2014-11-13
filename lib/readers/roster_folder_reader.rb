module FellowshipOne

  class RosterFolderReader < ApiReader

    # Constructor.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param roster_folder_id The ID of the roster folder to load.
    def initialize(activity_id, roster_folder_id)
      @url_data_path = "/activities/v1/activities/#{activity_id}/rosterfolders/#{roster_folder_id}"
    end
    
  end

end