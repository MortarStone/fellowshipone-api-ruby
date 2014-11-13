module FellowshipOne

  class TypeGroupReader < ApiReader

    # Constructor.
    #
    # @param type_group_id The ID of the type group to load.
    def initialize(type_group_id)
      @url_data_path = "/activities/v1/typegroups/#{type_group_id}"
    end
    
  end

end