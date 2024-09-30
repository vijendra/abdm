module AbdmAPI::V1
  module Abha
    class Registration < AbdmAPI::Base
      def initialize(conn = nil)
        @conn = conn || connection
      end
  
      def generate_aadhaar_otp(payload)
        #payload = {aadhaar: adhar}
        post_request(@conn, '/api/v1/registration/aadhaar/generateOtp', payload)
      end
 
      def resend_aadhaar_otp(payload)
        #payload = {txnId: txn_id}
        post_request(@conn, '/api/v1/registration/aadhaar/resendAadhaarOtp', payload)
      end
            
      def verify_aadhaar_otp(payload)
        #payload = {otp: otp, txnId: txn_id}
        post_request(@conn, '/api/v1/registration/aadhaar/verifyOTP', payload)
      end

      def generate_mobile_otp(payload)
        #payload = {mobile: mobile, txnId: txn_id}
        post_request(@conn, '/api/v1/registration/aadhaar/generateMobileOTP', payload)
      end
      
      def verify_mobile_otp(payload)
        #payload = {otp: otp, txnId: txn_id}
        post_request(@conn, '/api/v1/registration/aadhaar/verifyMobileOTP', payload)
      end
      
      def verify_biometric(payload)
        #payload = {aadhaar: aadhaar, bioType: bio_type, pid: pid}
        post_request(@conn, '/api/v1/registration/aadhaar/verifyBio', payload)
      end
      
      def create_health_id_with_pre_verified(payload)
        #payload = {email: email, firstName: first_name, healthId: health_id, lastName: last_name, middleName: middle_name, password: password, profilePhoto: profile_photo, txnId: txn_id}
        post_request(@conn, '/api/v1/registration/aadhaar/createHealthIdWithPreVerified', payload)
      end
    end
  end
end
