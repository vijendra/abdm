require 'faraday'

module AbdmAPI::V1
  module Abha
    class Registration < AbdmAPI::Base
      def initialize(conn = nil)
        @conn = conn || connection
      end
  
      def generate_aadhaar_otp(adhar)
        payload = {aadhaar: adhar}.to_json
        post_request(@conn, '/api/v1/registration/aadhaar/generateOtp', payload)
      end
 
      def resend_aadhaar_otp(txn_id)
        response = @conn.post('/api/v1/registration/aadhaar/resendAadhaarOtp') do |req|
          req.body = {txnId: txn_id}.to_json
          access_token = fetch_access_token
   
          req.headers[:Authorization] = "Bearer #{access_token}"
        end
        
        JSON.parse(response.body)
      end
            
      def verify_aadhaar_otp(otp, txn_id)
        response = @conn.post('/api/v1/registration/aadhaar/verifyOTP') do |req|
          req.body = {otp: otp, txnId: txn_id}.to_json
          access_token = fetch_access_token
   
          req.headers[:Authorization] = "Bearer #{access_token}"
        end
        
        JSON.parse(response.body)
      end

      def generate_mobile_otp(mobile, txn_id)
        response = @conn.post('/api/v1/registration/aadhaar/generateMobileOTP') do |req|
          req.body = {mobile: mobile, txnId: txn_id}.to_json
          access_token = fetch_access_token
   
          req.headers[:Authorization] = "Bearer #{access_token}"
        end
        
        JSON.parse(response.body)
      end
      
      def verify_mobile_otp(otp, txn_id)
        response = @conn.post('/api/v1/registration/aadhaar/verifyMobileOTP') do |req|
          req.body = {otp: otp, txnId: txn_id}.to_json
          access_token = fetch_access_token
   
          req.headers[:Authorization] = "Bearer #{access_token}"
        end
        
        JSON.parse(response.body)
      end
      
      def create_health_id_with_pre_verified(email, first_name, health_id, lastName, middleName, password, profilePhoto, txn_id)
        response = @conn.post('/api/v1/registration/aadhaar/createHealthIdWithPreVerified') do |req|
          req.body = {email: otp, firstName: first_name, healthId: health_id, lastName: last_name, middleName: middle_name, password: password, profilePhoto: profile_photo, txnId: txn_id}.to_json
          access_token = fetch_access_token
   
          req.headers[:Authorization] = "Bearer #{access_token}"
        end
        
        JSON.parse(response.body)
      end
    end
  end
end
