#
# small monkey patch for the oauth-ruby gem, 
# for compatibility with typhoeus > 0.5.0
#
module OAuth::RequestProxy::Typhoeus
  class Request < OAuth::RequestProxy::Base

    def method
      request.options[:method].to_s.upcase
    end
    
  end
end