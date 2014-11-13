module FellowshipOne

  class TypeReader < ApiReader

    # Constructor.
    #
    # @param type_id The ID of the type to load.
    def initialize(type_id)
      @url_data_path = "/activities/v1/types/#{type_id}"
    end
    
  end

end