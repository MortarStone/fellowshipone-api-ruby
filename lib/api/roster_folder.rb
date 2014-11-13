module FellowshipOne

  class RosterFolder < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name,
                     :activity

    # Load the roster_folder by the specified ID.
    #
    # @param activity_id The ID of the activity to scope to.
    # @param roster_folder_id The ID of the roster_folder to load.
    #
    # Returns a new RosterFolder object.
    def self.load_by_id(activity_id, roster_folder_id)
      reader = RosterFolderReader.new(activity_id, roster_folder_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a RosterFolderReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(RosterFolderReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end


    def activity  
      @activity_cache ||= Activity.load_by_id( @activity['id'] )
    end

  end

end


