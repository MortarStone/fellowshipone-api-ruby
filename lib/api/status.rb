module FellowshipOne

  class Status < ApiObject

    f1_attr_accessor :id,
                     :name

    # Load the status by the specified ID.
    #
    # @param status_id The ID of the status to load.
    #
    # Returns a new Status object.
    def self.load_by_id(status_id)
      reader = StatusReader.new(status_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a StatusReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(StatusReader)
        initialize_from_json_object(reader.load_feed['fund'])
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
    end

  end

end
