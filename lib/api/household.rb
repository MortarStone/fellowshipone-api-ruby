module FellowshipOne

	class Household < ApiObject

		f1_attr_accessor :id,
                     :household_name,
										 :household_sort_name,
										 :household_first_name,
										 :last_security_authorization,
										 :last_activity_date,
										 :created_date,
										 :last_updated_date

    # Loads the household by the specified ID.
    #
    def self.load_by_id(household_id)
      reader = HouseholdReader.new(household_id)
      self.new(reader.load_feed['household'])
    end


    # Constructor.
    #
    # @param json_data (optional) The object that has the data.
    def initialize(json_data = nil)
      initialize_from_json_object(json_data) unless json_data.nil?     	
    end

	end

end