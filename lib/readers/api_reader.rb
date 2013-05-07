module FellowshipOne

  # This adapter is the standard for all loading objects.
  class ApiReader
    attr_reader :headers

    # Loads the list
    #
    # @return the data loaded in a JSON object.
    def load_feed
     
      @url_data_params ||= {}
      response = FellowshipOne::api_request(:get, @url_data_path, @url_data_params)
      data = JSON.parse(response.body)
      @headers = response.headers

      return data.keys == ['results'] ? data['results'] : data
    end

  end

end