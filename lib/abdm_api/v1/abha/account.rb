module AbdmAPI::V1
  module Abha
    class Account < AbdmAPI::Base
      def initialize(conn = nil)
        @conn = conn || connection
      end
  
      def account_information(x_token)
        response = @conn.get(
          '/api/v1/account/profile', 
          {}, 
          { 'Accept-Language' => 'en-US',  "X-Token" => "Bearer #{x_token}", "Authorization" => "Bearer #{fetch_access_token}" }
        )
        handle_response(response)
      end
 
    end
  end
end
