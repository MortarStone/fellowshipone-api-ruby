module FellowshipOne

  class CommunicationWriter < ApiWriter

    # Constructor.
    #
    # @param data The json object data to save.
    def initialize(data)
      if data[:id]
        @url_action = :put
        @url_data_path = "/v1/People/#{data[:person_id]}/Communications/#{data[:id]}"
      else
        @url_action = :post
        @url_data_path = "/v1/People/#{data[:person_id]}/Communications"
      end
      @url_data_delete_path = "/v1/Communications/#{data[:id]}"

      @url_data_params = @url_data_params = {:communication => data}

      @updatable_fields = []
    end
    
  end

end