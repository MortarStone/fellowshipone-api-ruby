module FellowshipOne

  class PersonReader < ApiReader

    # Constructor.
    #
    # @param person_id (optional) The ID of the person to load.
    def initialize(person_id = nil)
      if person_id.nil?
        @url_new_data_path = '/v1/People/New'
      else
        @url_data_path = "/v1/People/#{person_id}"
      end
    end
    
  end

end


