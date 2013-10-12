module FellowshipOne

  class Household < ApiObject

    f1_attr_accessor :id,
                     :uri,
                     :old_id,
                     :h_code,
                     :household_name,
                     :household_sort_name,
                     :household_first_name,
                     :last_security_authorization,
                     :last_activity_date,
                     :created_date,
                     :last_updated_date # This is a datetime

    # Loads the household by the specified ID.
    #
    def self.load_by_id(household_id)
      reader = HouseholdReader.new(household_id)
      self.new(reader)
    end


    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a HouseholdReader or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(HouseholdReader)
        initialize_from_json_object(reader.load_feed['household'])
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      else # new 
        reader = HouseholdReader.new
        initialize_from_json_object(reader.load_new['household'])        
      end    
    end
    

    def _field_map
      {:id => '@id',
       :uri => '@uri',
       :oldId => '@oldID',
       :hCode => '@hCode'}
    end
  end

end