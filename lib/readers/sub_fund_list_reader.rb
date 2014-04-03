module FellowshipOne

  class SubFundListReader < ApiReader

    # Constructor.    
    def initialize(fund_id, options = {})
      @url_data_params = options[:url_data_params]
      @url_data_path = options[:url_data_path] || "/giving/v1/funds/#{fund_id}/subfunds"
    end

  end

end