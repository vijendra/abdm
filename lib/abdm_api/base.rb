# frozen_string_literal: true

require 'faraday'
require 'ostruct'
 
module AbdmAPI
  class Base < OpenStruct
     
    private

    def connection
      faraday_connection(AbdmAPI.configuration.api_base_url)
    end
    
    def faraday_connection(url)
      Faraday.new(
          url: url,
          headers: {'Content-Type' => 'application/json'}
      )
    end
    
    def fetch_access_token
      #TODO Move to separate Session class
      session_conn = faraday_connection('https://dev.abdm.gov.in')
 
      response = session_conn.post('/gateway/v0.5/sessions') do |req|
         req.body = {clientId: AbdmAPI.configuration.client_id, clientSecret: AbdmAPI.configuration.client_secret}.to_json
      end
      puts response.body  
      JSON.parse(response.body)["accessToken"]
    end
 
    def post_request(conn, url, payload)
      access_token = fetch_access_token
      
      response = conn.post(url) do |req|
        req.body = payload.to_json

        req.headers[:Authorization] = "Bearer #{access_token}"
      end
        
      JSON.parse(response.body)
    end
    
    def self.handle_response(response)
      case response.code.to_i
 	when 200...300 then self.construct(response.parsed_response)
        when 401 then raise AbdmAPI::AuthenticationError, "#{response.body}: Verify your api token."
 	else
 	  raise AbdmAPI::UnexpectedError, response.body
      end
    end
 
  end
end
