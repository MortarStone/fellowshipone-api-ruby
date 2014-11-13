module FellowshipOne

  class RosterFolderList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})    
      reader = options[:reader] || FellowshipOne::RosterFolderListReader.new(options)
      @json_data = reader.load_feed  
      @count = @json_data.size
      @page_number = 1
      @total_records = @count
      @additional_pages = 0
    end

    # Get the specified roster_folder.
    #
    # @param index The index of the roster_folder to get.
    #
    # @return RosterFolder
    def [](index)
      RosterFolder.new( @json_data[index] ) if @json_data[index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data.each{ |cont_recpt| yield( RosterFolder.new(cont_recpt) )}
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