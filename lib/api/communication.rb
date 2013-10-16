module FellowshipOne

  class Communication < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :household,
                     :person,
                     :communication_type,
                     :communication_general_type,
                     :communication_value,
                     :search_communication_value,
                     :preferred,
                     :communication_comment,
                     :created_date,
                     :last_updated_date

    # Load the communication by the specified ID.
    #
    # @param communication_id The ID of the communication to load.
    #
    # Returns a new Communication object.
    def self.load_by_id(communication_id)
      reader = CommunicationReader.new(nil, communication_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param person_id The ID of the person to load the communication for.
    # @param reader (optional) The object that has the data. This can be a CommunicationReader or Hash object.
    def initialize(person_id, reader = nil)      
      @writer_object = CommunicationWriter
      if reader.is_a?(CommunicationReader)
        initialize_from_json_object(reader.load_feed['communication'])
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      else # new 
        reader = CommunicationReader.new(person_id, nil)
        initialize_from_json_object(reader.load_new['communication'])        
      end   
    end
    
    def household_id
      self.household['@id']
    end
    
    def individual_id
      self.person['@id']
    end
    alias_method :person_id, :individual_id

    def _field_map
      {:id => '@id',
       :uri => '@uri'}
    end
  end

end
