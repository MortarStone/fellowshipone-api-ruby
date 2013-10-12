module FellowshipOne

  include Enumerable

  PersonAddress = Struct.new(:is_primary?, :street, :street2, :city, :state, :postal_code)
  PersonCommunication = Struct.new(:is_phone?, :is_mobile?, :is_email?, :type, :value, :preferred?)

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
      else # new empty
        reader = PersonReader.new
        initialize_from_json_object(reader.load_new['person'])
      end         
    end


    def is_head_of_household?
      (!self.household_member_type.nil? and self.household_member_type['name'].downcase == 'head')
    end


    def family_role
      begin
        person.household_member_type['name']
      rescue
        'Other'
      end
    end


    def is_child?
      begin
        person.household_member_type['name'].downcase == 'child'
      rescue
        false
      end
    end


    def addresses
      return nil if @addresses.nil?
      return @addresses_cache unless @addresses_cache.nil?

      @addresses_cache = []
      @addresses['address'].each do |addr|
        @addresses_cache << PersonAddress.new(
          addr['addressType']['name'].downcase == 'primary', 
          addr['address1'], 
          addr['address2'], 
          addr['city'], 
          addr['stProvince'], 
          addr['postalCode']
        )
      end    
      @addresses_cache
    end


    def communications
      return nil if @communications.nil?
      return @communications_cache unless @communications_cache.nil?

      @communications_cache = []
      @communications['communication'].each do |comm|
        @communications_cache << PersonCommunication.new(
          comm['communicationType']['name'].downcase.include?('phone'), 
          comm['communicationType']['name'].downcase.include?('mobile'), 
          comm['communicationType']['name'].downcase.include?('email'), 
          comm['communicationType']['name'], 
          comm['communicationValue'],
          comm['preferred'].downcase == 'true'
        )
      end    
      @communications_cache      
    end

  end

end
