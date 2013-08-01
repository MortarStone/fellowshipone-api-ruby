module FellowshipOne

  class FundListReader < ApiReader

    # Constructor.    
    def initialize(options = {})
      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/giving/v1/funds"
    end

  end

end