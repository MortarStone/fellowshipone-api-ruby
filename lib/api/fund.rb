module FellowshipOne

  class Fund < ApiObject

    f1_attr_accessor :id,
                     :name,
                     :fund_type,
                     :fund_code,
                     :is_web_enabled,
                     :account_reference,
                     :is_active,
                     :created_date,
                     :created_by_person,
                     :last_updated_date,
                     :last_updated_by_person

    # Load the fund by the specified ID.
    #
    # @param fund_id The ID of the fund to load.
    #
    # Returns a new Fund object.
    def self.load_by_id(fund_id)
      reader = FundReader.new(fund_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a FundReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(FundReader)    
        initialize_from_json_object(reader.load_feed['fund'])
      elsif reader.is_a?(Hash)        
        initialize_from_json_object(reader)
      end
    end

  end

end
