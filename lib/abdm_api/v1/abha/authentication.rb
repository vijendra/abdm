module AbdmAPI::V1
  module Abha
    class Authentication < AbdmAPI::Base
      def initialize(conn = nil)
        @conn = conn || connection
      end
  
      def init_auth(healthid, auth_method)
        payload = {authMethod: auth_method, healthid: healthid}
        post_request(@conn, '/api/v1/auth/init', payload)
      end
 
      def confirm_with_adhaar_otp(otp, txn_id)
        payload = {otp: otp, txnId: txn_id}
        post_request(@conn, '/api/v1/auth/confirmWithAadhaarOtp', payload)
      end
      
      def confirm_with_mobile_otp(otp, txn_id)
        payload = {otp: otp, txnId: txn_id}
        post_request(@conn, '/api/v1/auth/confirmWithMobileOTP', payload)
      end
      
      def confirm_with_demographic_data(gender, name, txn_id, year_of_birth)
        payload = {gender: gender, name, name, txnId: txn_id, yearOfBirth: year_of_birth}
        post_request(@conn, '/api/v1/auth/confirmWithDemographics', payload)
      end
    end
  end
end
