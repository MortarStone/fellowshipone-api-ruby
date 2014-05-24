module FellowshipOne

  class StatusReader < ApiReader

    # Constructor.
    #
    # @param status_id The ID of the fund to load.
    def initialize(status_id)
      @url_data_path = "/v1/People/Statuses/#{status_id}"
    end
    
  end

end