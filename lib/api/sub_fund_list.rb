module FellowshipOne

  class SubFundList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Get the list of sub-funds for a given fund.
    #
    # Options:
    # :reader - (optional) The Reader to use to load the data.
    def initialize(fund_id, options = {})
      reader = options[:reader] || FellowshipOne::SubFundListReader.new(fund_id, options)
      @json_data = reader.load_feed
      @json_data['subFunds'] = {'subFund' => []} if reader.load_feed["subFunds"].nil?    
      @count = @json_data['subFunds']['subFund'].size.to_i
      @page_number = 1
      @total_records = @count
      @additional_pages = 0
    end

    # Get the specified fund.
    #
    # @param index The index of the fund to get.
    #
    # @return Fund
    def [](index)
      Fund.new( @json_data['subFunds']['subFund'][index] ) if @json_data['subFunds']['subFund'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['subFunds']['subFund'].each{ |cont_recpt| yield( Fund.new(cont_recpt) )}
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