module FellowshipOne

  class Roster < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name,
                     :activity,
                     :roster_folder,
                     :checkin_auto_open,
                     :checkin_enabled,
                     :has_name_tag,
                     :has_receipt,
                     :default_capacity,
                     :start_age_date,
                     :end_age_date,
                     :start_age_range,
                     :end_age_range,
                     :default_age,
                     :schedule_id,
                     :pager_enabled,
                     :is_closed

    # Load the roster by the specified ID.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param roster_id The ID of the roster to load.
    #
    # Returns a new Roster object.
    def self.load_by_id(activity_id, roster_id)
      reader = RosterReader.new(activity_id, roster_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a RosterReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(RosterReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end


    def activity  
      @activity_cache ||= Activity.load_by_id( @activity['id'] )
    end


    def roster_folder  
      @roster_folder_cache ||= RosterFolder.load_by_id( @activity['id'], @roster_folder['id'] )
    end

    # Alias the roster_folder method
    alias :rosterfolder :roster_folder

  end

end


