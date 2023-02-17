# frozen_string_literal: true

require 'faraday'
require 'ostruct'
 
module AbdmAPI
  class Base < OpenStruct
     
    private

    def connection
      faraday_connection(AbdmAPI.configuration.api_base_url)
    end

    def health_facility_connection
      faraday_connection(AbdmAPI.configuration.facility_base_url)
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

      JSON.parse(response.body)["accessToken"]
    end
 
    def post_request(conn, url, payload)
      access_token = fetch_access_token
      
      response = conn.post(url) do |req|
        req.body = payload.to_json

        req.headers[:Authorization] = "Bearer #{access_token}"
      end

      handle_response(response)
    end
    
    def handle_response(response)
      { "code" => response.status, "body" => JSON.parse(response.body) } 
    end
 
  end
end
