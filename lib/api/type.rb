module FellowshipOne

  class Type < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name,
                     :typegroup

    # Load the type by the specified ID.
    #
    # @param type_id The ID of the type to load.
    #
    # Returns a new Type object.
    def self.load_by_id(type_id)
      reader = TypeReader.new(type_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a TypeReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(TypeReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end


    def typegroup
      @type_group_cache ||= TypeGroup.load_by_id( @typegroup['id'] )
    end

    # Alias the typegroup method
    alias :type_group :typegroup

  end

end


