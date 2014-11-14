module FellowshipOne

  class AttendanceReader < ApiReader

    # Constructor.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param attendance_id The ID of the attendance to load.
    def initialize(activity_id, attendance_id)
      @url_data_path = "/activities/v1/activities/#{activity_id}/attendances/#{attendance_id}"
    end
    
  end

end