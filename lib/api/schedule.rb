module FellowshipOne

  class Schedule < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name,
                     :start_time,
                     :end_time

    # Load the schedule by the specified ID.
    #
    # @param schedule_id The ID of the schedule to load.
    #
    # Returns a new Schedule object.
    def self.load_by_id(schedule_id)
      reader = ScheduleReader.new(schedule_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a ScheduleReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(ScheduleReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end

  end

end


