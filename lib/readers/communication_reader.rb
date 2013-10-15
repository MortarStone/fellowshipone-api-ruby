module FellowshipOne

  class CommunicationReader < ApiReader

    # Constructor.
    #
    # @param person_id The ID of the person to load the communication for.
    # @param communication_id (optional) The ID of the communication to load.
    def initialize(person_id, communication_id = nil)
      if communication_id.nil?
        @url_new_data_path = "/v1/People/#{person_id}/Communications/new"
      else
        @url_data_path = "/v1/People/#{person_id}/Communications/#{communication_id}"
      end      
    end
    
  end

end