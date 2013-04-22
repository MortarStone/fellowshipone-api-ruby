module FellowshipOne

  class PersonWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/v1/People/#{data[:id]}"
      else
        @url_action = :post
        @url_data_path = "/v1/People"
      end
      @url_data_delete_path = "/v1/People/#{data[:id]}"

      @url_data_params = data

      @updatable_fields = [:title,
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
			                   ]
    end
    
  end

end