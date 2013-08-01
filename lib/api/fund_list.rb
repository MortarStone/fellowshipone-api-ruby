module FellowshipOne

  class FundList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(options = {})
      #options[:page] ||= 1
      reader = options[:reader] || FellowshipOne::FundListReader.new(options)
      @json_data = reader.load_feed
      # @count = @json_data['@count'].to_i
      # @page_number = @json_data['@pageNumber'].to_i
      # @total_records = @json_data['@totalRecords'].to_i
      # @additional_pages = @json_data['@additionalPages'].to_i
    end


    # Get the specified fund.
    #
    # @param index The index of the fund to get.
    #
    # @return Fund
    def [](index)
      Fund.new( @json_data['funds']['fund'][index] ) if @json_data['funds']['fund'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['funds']['fund'].each{ |cont_recpt| yield( Fund.new(cont_recpt) )}
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