module FellowshipOne

  class HouseholdList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options)
      #options[:page] ||= 1
      reader = options[:reader] || FellowshipOne::HouseholdListReader.new(options)
      @json_data = reader.load_feed

      @count = @json_data['@count'].to_i
      @page_number = @json_data['@pageNumber'].to_i
      @total_records = @json_data['@totalRecords'].to_i
      @additional_pages = @json_data['@additionalPages'].to_i
    end



    # Get the specified user.
    #
    # @param index The index of the user to get.
    #
    # @return [User]
    def [](index)
      Household.new( @json_data['household'][index] ) if @json_data['household'] and @json_data['household'][index]
    end

    def all_names
      return [] unless @json_data['household']
      @json_data['household'].collect { |household| household['householdName'] }
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

    # Get all the household ids in the list.
    #
    # @return An array of household ids.
    def ids
      (@json_data['household'].collect { |household| household['@id'] }).uniq
    end

    # Access to the raw JSON data.  This method is needed for merging lists.
    #
    # @returns Raw JSON data.
    def raw_data
      @json_data
    end


  end
    
  
end