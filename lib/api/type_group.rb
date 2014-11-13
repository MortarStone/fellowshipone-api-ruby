module FellowshipOne

  class TypeGroup < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name

    # Load the type_group by the specified ID.
    #
    # @param type_group_id The ID of the type_group to load.
    #
    # Returns a new TypeGroup object.
    def self.load_by_id(type_group_id)
      reader = TypeGroupReader.new(type_group_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a TypeGroupReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(TypeGroupReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end

  end

end


