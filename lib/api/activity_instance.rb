module FellowshipOne

  class ActivityInstance < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :schedule,
                     :start_date_time,
                     :start_checkin,
                     :end_checkin

    # Load the activity instance by the specified ID.
    #
    # @param schedule_id The ID of the schedule to scope to.
    # @param activity_instance_id The ID of the activity_instance to load.
    #
    # Returns a new ActivityInstance object.
    def self.load_by_id(schedule_id, activity_instance_id)
      reader = ActivityInstanceReader.new(schedule_id, activity_instance_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a ActivityInstanceReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(ActivityInstanceReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end


    def schedule  
      @schedule_cache ||= Schedule.load_by_id( @schedule['id'] )
    end

  end

end


