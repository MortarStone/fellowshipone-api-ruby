module FellowshipOne

  class ActivityInstanceReader < ApiReader

    # Constructor.
    #
    # @param schedule_id The ID of the schedule to scope to.
    # @param activity_instance_id The ID of the actvity instance to load.
    def initialize(schedule_id, activity_instance_id)
      @url_data_path = "/activities/v1/schedules/#{schedule_id}/instances/#{activity_instance_id}"
    end
    
  end

end