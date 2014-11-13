module FellowshipOne

  class GroupReader < ApiReader

    # Constructor.
    #
    # @param group_id The ID of the type group to load.
    def initialize(group_id)
      @url_data_path = "/activities/v1/groups/#{group_id}"
    end
    
  end

end