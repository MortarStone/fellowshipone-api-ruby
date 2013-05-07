module FellowshipOne

  class MemberHouseholdList

    include Enumerable

    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :page - (optional) The page number to get.
    # :reader - (optional) The Reader to use to load the data.
    # :household_id - The household ID to pull the info for.
    def initialize(options)
      raise 'Household ID not specified' if options[:household_id].nil?

      #options[:page] ||= 1
      reader = options[:reader] || FellowshipOne::MemberHouseholdListReader.new(options)
      @json_data = reader.load_feed
    end



    # Get the specified user.
    #
    # @param index The index of the user to get.
    #
    # @return [User]
    def [](index)
      Person.new( @json_data['people']['person'][index] ) if @json_data['people']['person'] and @json_data['people']['person'][index]
    end

    def all_names
      return [] unless @json_data['people']
      @json_data['people']['person'].collect { |person| [person['firstName'], person['lastName']].join(' ') }
    end

    # This method is needed for Enumerable.
    def each &block
      @json_data['people']['person'].each{ |person| yield( Person.new(person) )}
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
      @json_data['people']['person'].collect { |person| person['@id'] }
    end

    # Access to the raw JSON data.  This method is needed for merging lists.
    #
    # @returns Raw JSON data.
    def raw_data
      @json_data['people']['person']
    end


  end
    
  
end