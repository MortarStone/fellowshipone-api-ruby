module FellowshipOne

  class Attendance < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :person,
                     :activity,
                     :instance,
                     :roster,
                     :type,
                     :checkin,
                     :checkout,
                     :created_date,
                     :created_by_person,
                     :last_updated_date,
                     :last_updated_by_person

    # Load the attendance by the specified ID.
    #
    # @param attendance_id The ID of the attendance to load.
    #
    # Returns a new Attendance object.
    def self.load_by_id(attendance_id)
      reader = AttendanceReader.new(attendance_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a AttendanceReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(AttendanceReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end


    def person  
      @person_cache ||= Person.load_by_id( @person['id'] )
    end

    def activity  
      @activity_cache ||= Activity.load_by_id( @activity['id'] )
    end

    def instance  
      @instance_cache ||= ActivityInstance.load_by_id( @instance['id'] )
    end

    def roster  
      @roster_cache ||= Roster.load_by_id( @roster['id'] )
    end    

    def type  
      @type_cache ||= Type.load_by_id( @roster['id'] )
    end 

    def created_by_person  
      @created_by_person_cache ||= Person.load_by_id( @created_by_person['id'] )
    end   

    def last_updated_by_person  
      @last_updated_by_person_cache ||= Person.load_by_id( @last_updated_by_person['id'] )
    end   

  end

end
