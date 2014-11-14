module FellowshipOne

  class AssignmentReader < ApiReader

    # Constructor.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param assignment_id The ID of the attendance to load.
    def initialize(activity_id, assignment_id)
      @url_data_path = "/activities/v1/activities/#{activity_id}/assignments/#{assignment_id}"
    end
    
  end

end