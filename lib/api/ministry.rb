module FellowshipOne

  class Ministry < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :name

    # Load the ministry by the specified ID.
    #
    # @param ministry_id The ID of the ministry to load.
    #
    # Returns a new Ministry object.
    def self.load_by_id(ministry_id)
      reader = MinistryReader.new(ministry_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a MinistryReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(MinistryReader)    
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end

  end

end


