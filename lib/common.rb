module FellowshipOne
  require 'json'
  require 'time'

  def self.api_request(method, path, params = {}, body = '')
    # response = case method
    # when :post
    #   Typhoeus::Request.post(url, {:headers => self._build_api_headers, :body => body})
    # when :get
    #   Typhoeus::Request.get(url, {:headers => self._build_api_headers, :params => params})
    # when :put
    #   Typhoeus::Request.put(url, {:headers => self._build_api_headers, :body => body})
    # when :delete
    #   Typhoeus::Request.delete(url, {:headers => self._build_api_headers, :params => params})
    # end   
    
    response = self._oauth_request_get(method, path, params, body)

    unless response.success?
      puts response.inspect
      if response.code > 0
        raise FellowshipOneExceptions::UnableToConnectToFellowshipOne.new(response.body)
      else
        begin
          error_messages = JSON.parse(response.body)['error_message']
        rescue
          response_code_desc = response.headers.partition("\r\n")[0].sub(/^\S+/, '') rescue nil
          raise FellowshipOneExceptions::UnknownErrorConnectingToFellowshipOne.new("Unknown error when connecting to FellowshipOne API. #{response_code_desc}")
        else
          raise FellowshipOneExceptions::FellowshipOneResponseError.new(error_messages)
        end
      end
    end    
    
    response
  end


  def self._oauth_request_get(method, path, params, body)
    consumer_env = FellowshipOne::Api.is_production ? '' : '.staging'
    base_url = "https://#{FellowshipOne::Api.church_code}#{consumer_env}.fellowshiponeapi.com"
    url = base_url + path
    if method == :get
      url_params = params.collect { |k, v| "#{k}=#{CGI::escape(v.to_s)}" }.join('&')
      url_params = nil if url_params.empty?
      url = [url, url_params].compact.join('?')
      params = {}
    end 

    consumer = OAuth::Consumer.new(FellowshipOne::Api.consumer_key, 
                                   FellowshipOne::Api.consumer_secret, 
                                   :site => base_url, 
                                   :http_method => method)
    access_token = OAuth::AccessToken.new(consumer, FellowshipOne::Api.api_token, FellowshipOne::Api.api_secret)
    
    options = {:params => params, :method => method, :body => body}
    oauth_params = {:consumer => consumer, :token => access_token}
    hydra = Typhoeus::Hydra.new
    req = Typhoeus::Request.new(url, options)

    # {'Content-Type' => 'application/vnd.fellowshiponeapi.com.people.people.v2+json'}
    # req.headers.merge!({'Content-Type' => 'application/json'})
    req.options[:headers].merge!({'Content-Type' => 'application/json'})
    oauth_helper = OAuth::Client::Helper.new(req, oauth_params.merge(:request_uri => url))
    
    #req.headers.merge!({"Authorization" => oauth_helper.header})
    req.options[:headers].merge!({"Authorization" => oauth_helper.header}) # Signs the request
    
    hydra.queue(req)
    hydra.run

    req.response
  end  

end

