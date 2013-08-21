module FellowshipOne

  class PersonListReader < ApiReader

    # Constructor.
    #
    # Options:
    # :page - (optional) The page number to get.  The default is 1.
    # :per_page - (optional) The number of items to return per page.
    # :search_for - (optional) Search for name in the request.
    # :created_date - (optional) Search for those created on or after specified date.
    #
    # ** search params are mutually exclusive and cannot be used with any other search parameters
    def initialize(options = {})
      page = options[:page] || 1
      per_page = options[:per_page] || 100

      @url_data_params = {}
      @url_data_path = (options[:search_for].nil? and options[:created_date].nil?) ? '/v1/People' : '/v1/People/Search'

      @url_data_params.merge!({:page => page, :include => 'addresses,communications'}) if page
      @url_data_params.merge!({:recordsPerPage => per_page}) if per_page
      @url_data_params.merge!({:searchFor => options[:search_for]}) if options[:search_for]
      @url_data_params.merge!({:createdDate => options[:created_date]}) if options[:created_date]
    end

  end

end