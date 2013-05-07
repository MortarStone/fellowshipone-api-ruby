module FellowshipOne

  class HouseholdList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages

    # def all_names
    #   return [] unless @json_data['person']
    #   @json_data['person'].collect { |person| [person['firstName'], person['lastName']].join(' ') }
    # end

    # alias_method :names, :all_names


    # def self.search_by_name(name)
    #   options = {:url_data_params => {:searchFor => name}, 
    #              :url_data_path => "/v1/People/Search"
    #             }
    #   reader = FellowshipOne::HouseholdListReader.new(options)
    #   self.new(reader.load_feed)
    # end

    # Get the specified user.
    #
    # @param index The index of the user to get.
    #
    # @return [User]
    def [](index)
      Household.new( @json_data['household'][index] ) if @json_data['household'] and @json_data['household'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['household'].each{ |household| yield( Household.new(household) )}
    end
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      #@json_data['person'].empty?
      self.count == 0 ? true : false
    end

    # Access to the raw JSON data.  This method is needed for merging lists.
    #
    # @returns Raw JSON data.
    def raw_data
      @json_data
    end


  end
    
  
end