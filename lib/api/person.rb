module FellowshipOne

  include Enumerable

  class Person < ApiObject
    f1_attr_accessor :title,
                     :salutation,
                     :prefix,
                     :first_name, #required
                     :last_name,  #required
                     :suffix,
                     :middle_name,
                     :goes_by_name,
                     :former_name,
                     :gender,
                     :date_of_birth,
                     :marital_status,
                     :household_member_type, #required
                     :is_authorized,
                     :status, #required
                     :occupation,
                     :employer,
                     :school,
                     :denomination,
                     :former_church,
                     :bar_code,
                     :member_envelope_code,
                     :default_tag_comment,
                     :weblink,
                     :solicit,
                     :thank,
                     :first_record,
                     :last_match_date,
                     :created_date,
                     :last_updated_date,
                     :id,
                     :uri,
                     :image_uri,
                     :old_id,
                     :i_code,
                     :household_id,
                     :old_household_id,
                     :attributes,
                     :addresses,
                     :communications

    # Loads the user by the specified ID.
    #
    # @param person_id The ID of the person to load.
    #
    # Returns a new Person object.
    def self.load_by_id(person_id)
      reader = PersonReader.new(person_id)
      self.new(reader)
    rescue
      nil      
    end


    # Constructor.
    #
    # @param reader (optional) The object that has the data.  This can be a PersonReader or Hash object.
    # @param options (optional) Options for including more information.
    def initialize(reader = nil, options = {})    
      @writer_object = PersonWriter

      if reader.is_a?(PersonReader)
        initialize_from_json_object(reader.load_feed['person'])
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end         
    end
    
  end

end


