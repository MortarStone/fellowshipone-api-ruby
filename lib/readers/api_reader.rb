module FellowshipOne

  # This adapter is the standard for all loading objects.
  class ApiReader
    attr_reader :headers

    # Retrieve an empty resource with the proper structure.
    #
    # @return a new empty resource.
    def load_new
      return if @url_new_data_path.nil?
      return _load_data(@url_new_data_path, {})
    end      

    # Loads the list
    #
    # @return the data loaded in a JSON object.
    def load_feed
      @url_data_params ||= {}
      return _load_data(@url_data_path, @url_data_params)
    end

    private

    def _load_data(url_data_path, url_data_params)
      response = FellowshipOne::api_request(:get, url_data_path, url_data_params)
      data = JSON.parse(response.body)
      @headers = response.headers
      return data.keys == ['results'] ? data['results'] : data
    end

  end

end