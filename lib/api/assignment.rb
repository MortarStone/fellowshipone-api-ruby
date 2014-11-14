module FellowshipOne

  class Assignment < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :type,
                     :person,
                     :activity,
                     :schedule,
                     :roster,
                     :roster_folder,
                     :created_date,
                     :created_by_person,
                     :last_updated_date,
                     :last_updated_by_person

    # Load the assignment by the specified ID.
    #
    # @param assignment_id The ID of the assignment to load.
    #
    # Returns a new Assignment object.
    def self.load_by_id(assignment_id)
      reader = AssignmentReader.new(assignment_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a AssignmentReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(AssignmentReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end
   

    def type  
      @type_cache ||= Type.load_by_id( @roster['id'] )
    end 

    def person_id
      @person['id']
    end

    def person  
      @person_cache ||= Person.load_by_id( @person['id'] )
    end

    def activity  
      @activity_cache ||= Activity.load_by_id( @activity['id'] )
    end

    def schedule  
      @schedule_cache ||= Schedule.load_by_id( @schedule['id'] )
    end

    def roster  
      @roster_folder_cache ||= Roster.load_by_id( @roster['id'] )
    end 

    def roster_folder
      @roster_folder_cache ||= RosterFolder.load_by_id( @roster_folder['id'] )
    end    
    alias :rosterfolder :roster_folder

    def created_by_person  
      @created_by_person_cache ||= Person.load_by_id( @created_by_person['id'] )
    end   

    def last_updated_by_person  
      @last_updated_by_person_cache ||= Person.load_by_id( @last_updated_by_person['id'] )
    end   

  end

end
