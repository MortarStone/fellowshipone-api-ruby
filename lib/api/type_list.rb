module FellowshipOne

  class TypeList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    # :type_group_id - The Type Group ID to pull the info for.
    def initialize(options = {})    
      raise 'Type Group ID not specified' if options[:type_group_id].nil?
      reader = options[:reader] || FellowshipOne::TypeListReader.new(options)
      @json_data = reader.load_feed  
      @count = @json_data.size
      @page_number = 1
      @total_records = @count
      @additional_pages = 0
    end

    # Get the specified type.
    #
    # @param index The index of the type to get.
    #
    # @return Type
    def [](index)
      Type.new( @json_data[index] ) if @json_data[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data.each{ |cont_recpt| yield( Type.new(cont_recpt) )}
    end

    # Alias the count method
    alias :size :count


    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      self.count == 0 ? true : false
    end

  end
  
end