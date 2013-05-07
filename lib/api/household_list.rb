module FellowshipOne

  class HouseholdList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages

    def initialize(json)
      @json_data = json["results"] || json #for flexibility due to differing F1 formats
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