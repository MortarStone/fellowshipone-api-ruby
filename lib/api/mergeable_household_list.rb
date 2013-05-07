module FellowshipOne

  class MergeableHouseholdList

    include Enumerable

		# Constructor.
    # 
    def initialize
      @json_data = { 'household' => [] }
       # commented out until can figure out what he was doing here.
    end


    # All the households in the list.
    #
    # @return array of names (first last).
    def all_names
      return [] unless @json_data['household']
      @json_data['household'].collect { |household| household['householdName'] }
    end

    alias_method :names, :all_names


    # Get the specified household.
    #
    # @param index The index of the household to get.
    #
    # @return [household]
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
      #@json_data['household'].empty?
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


    # Adds a HouseholdList to this list.
    #
    def add(household_list)
      @json_data['household'] += household_list.raw_data['household']
    end   

    alias_method :merge, :add  

  end
    
end