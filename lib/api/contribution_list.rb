module FellowshipOne

  class ContributionList

    include Enumerable

    attr_reader :count, :page_number, :total_records, :additional_pages


    # Constructor.
    #
    # @param options A hash of options for loading the list.
    #
    # Options:
    # :page - The page number to get.
    # :reader - The Reader to use to load the data.
    # :search - (optional) A donation name to search on.
    #
    #
    # Examples:
    # DonationList.new
    #
    # DonationList.new({:page => 2})
    #
    def initialize(json)
      @json_data = json["results"] || json #for flexibility due to differing F1 formats

      @count = @json_data['@count'].to_i
      @page_number = @json_data['@pageNumber'].to_i
      @total_records = @json_data['@totalRecords'].to_i
      @additional_pages = @json_data['@additionalPages'].to_i
    end
    
    
    # All the donations in the list.
    #
    # @return array of donation names.
    # def all_names
    #   @json_data['donations'].collect { |cont_recpt| cont_recpt['user_name'] }
    # end
    # alias :names :all_names  
    

    # Get the specified donation.
    #
    # @param index The index of the donation to get.
    #
    # @return [donation]
    def [](index)
      Contribution.new( @json_data['contributionReceipt'][index] ) if @json_data['contributionReceipt'][index]
    end


    # This method is needed for Enumerable.
    def each &block
      @json_data['contributionReceipt'].each{ |cont_recpt| yield( Contribution.new(cont_recpt) )}
    end

    # Alias the count method
    alias :size :count


    # Checks if the list is empty.
    #
    # @return True on empty, false otherwise.
    def empty?
      #@json_data['donations'].empty?
      self.count == 0 ? true : false
    end

  end
  
end