module FellowshipOne

	class Contribution < ApiObject

		f1_attr_accessor :id,
                     :uri,
                     :old_id,
                     :account_reference,
                     :amount,
                     :fund,
                     :sub_fund,
                     :pledge_drive,
                     :household,
                     :person,
                     :account,
                     :reference_image,
                     :batch,
                     :activity_instance,
                     :contribution_type,
                     :contribution_sub_type,
                     :received_date,
                     :transmit_date,
                     :return_date,
                     :retransmit_date,
                     :gl_post_date,
                     :is_split,
                     :address_verification,
                     :memo,
                     :stated_value,
                     :true_value,
                     :thank,
                     :thanked_date,
                     :is_matched,
                     :created_date,
                     :created_by_person,
                     :last_updated_date,
                     :last_updated_by_person

    # Load the contribution by the specified ID.
    #
    # @param contribution_id The ID of the contribution to load.
    #
    # Returns a new Contribution object.
    def self.load_by_id(contribution_id)
      reader = ContributionReader.new(contribution_id)
      self.new(reader)
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a ContributionReader or Hash object.
    def initialize(reader = nil)      
      @writer_object = ContributionWriter
      if reader.is_a?(ContributionReader)
        initialize_from_json_object(reader.load_feed['contributionReceipt'])
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      else # new 
        reader = ContributionReader.new
        initialize_from_json_object(reader.load_new['contributionReceipt'])        
      end   
    end


    def fund_id
      self.fund['@id']
    end
    
    def household_id
    	self.household['@id']
    end
    
    def individual_id
    	self.person['@id']
    end
    alias_method :person_id, :individual_id

    def amount_cents
      (self.amount.to_f * 100).to_i
    end

    def instrument_type
      self.contribution_type['name']
    end

    def _default_result_key
      'contributionReceipt'
    end

    def _field_map
      {:id => '@id',
       :uri => '@uri',
       :oldId => '@oldID'}
    end
	end

end
