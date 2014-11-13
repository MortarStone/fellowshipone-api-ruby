module FellowshipOne

  class ScheduleReader < ApiReader

    # Constructor.
    #
    # @param schedule_id The ID of the type group to load.
    def initialize(schedule_id)
      @url_data_path = "/activities/v1/schedules/#{schedule_id}"
    end
    
  end

end