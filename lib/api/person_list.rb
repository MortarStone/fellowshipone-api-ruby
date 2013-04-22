module FellowshipOne

  class PersonList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    # 
    def initialize(json)
      @json_data = json["results"] || json #for flexibility due to differing F1 formats
      @count = @json_data['@count'].to_i
      @page_number = @json_data['@pageNumber'].to_i
      @total_records = @json_data['@totalRecords'].to_i
      @additional_pages = @json_data['@additionalPages'].to_i
    end


    # All the people in the list.
    #
    # @return array of names (first last).
    def all_names
      return [] unless @json_data['person']
      @json_data['person'].collect { |person| [person['firstName'], person['lastName']].join(' ') }
    end

    alias_method :names, :all_names


    # Get the specified person.
    #
    # @param index The index of the person to get.
    #
    # @return [Person]
    def [](index)
      Person.new( @json_data['person'][index] ) if @json_data['person'] and @json_data['person'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['person'].each{ |person| yield( Person.new(person) )}
    end
  
    # Alias the count method
    alias :size :count

    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      #@json_data['person'].empty?
      self.count == "0" ? true : false
    end


    # Get all the people ids in the list.
    #
    # @return An array of people ids.
    def ids
      (@json_data['person'].collect { |person| person['@id'] }).uniq
    end


    # Access to the raw JSON data.  This method is needed for merging lists.
    #
    # @returns Raw JSON data.
    def raw_data
      @json_data
    end  

  end
    
  
end