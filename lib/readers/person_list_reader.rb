module FellowshipOne

  class PersonListReader < ApiReader

    # Constructor.
    #
    # @param page The page number to get. Default is 1.
    # @param options A hash of options for requesting data from the server.
    def initialize(options = {})
      page = options[:page] || 1
      filter = options[:filter]

      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/v1/People"

      @url_data_params.merge!({:page => page}) if page
      @url_data_params.merge!({:filter => filter}) if filter
    end

  end

end