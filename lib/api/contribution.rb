module FellowshipOne

	class Contribution < ApiObject

		f1_attr_accessor :account_reference,
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

    # Loads the donation by the specified ID.
    #
    # @param donation_id The ID of the donation to load.
    #
    # Returns a new {Donation} object.
    def self.load_by_id(contribution_id)
      contribution_reader = ContributionReader.new(contribution_id)
      self.new(contribution_reader.load_feed['contributionReceipt'])
    end

    # Constructor.
    #
    # @param reader (optional) The object that has the data. This can be a {DonationReader} or Hash object.
    def initialize(reader = nil)
      if reader.is_a?(ContributionReader)
        initialize_from_json_object(reader.load_feed)
      elsif reader.is_a?(Hash)
        initialize_from_json_object(reader)
      end
    end

    def household_id
    	self.household['@id']
    end

    def individual_id
    	self.person['@id']
    end
    alias_method :person_id, :individual_id
	end

end
