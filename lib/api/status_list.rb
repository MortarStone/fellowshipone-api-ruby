module FellowshipOne

  class StatusList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})
      reader = options[:reader] || FellowshipOne::StatusListReader.new(options)
      @json_data = reader.load_feed
      @count = @json_data['statuses']['status'].size.to_i
      @page_number = 1
      @total_records = @count
      @additional_pages = 0
    end

    # Get the specified status.
    #
    # @param index The index of the status to get.
    #
    # @return Status
    def [](index)
      Status.new( @json_data['statuses']['status'][index] ) if @json_data['statuses']['status'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['statuses']['status'].each{ |status| yield( Status.new(status) )}
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