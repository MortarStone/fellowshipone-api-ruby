module FellowshipOne

  class Activity < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name,
                     :description,
                     :has_checkin,
                     :checkin_minutes_before,
                     :has_name_tag,
                     :has_receipt,
                     :start_age,
                     :end_age,
                     :confidential,
                     :requires_registration,
                     :roster_by_schedule,
                     :assignments_override_closed_room,
                     :auto_assignment_option,
                     :pager_enabled,
                     :web_enabled

    # Load the activity by the specified ID.
    #
    # @param activity_id The ID of the activity to load.
    #
    # Returns a new Activity object.
    def self.load_by_id(activity_id)
      reader = ActivityReader.new(activity_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a ActivityReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(ActivityReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end

  end

end


