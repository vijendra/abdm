 module AbdmAPI::V1::HealthcareProfessional

  class Registration < AbdmAPI::Base
    def initialize
      @conn = healthcare_professional_connection
    end

    def generate_aadhaar_otp(adhar)
      payload = {aadhaar: adhar, iagree: true, consentVersion: 'V1'}
      post_request(@conn, '/api/v1/registration/aadhaar/generateOtp', payload)
    end

    def suggestion(txn_id)
      payload = { txnId: txn_id }
      post_request(@conn, '/v1/registration/aadhaar/hpid/suggestion', payload)
    end

    def verify_aadhaar_otp(otp, txn_id)
      payload = { otp: otp, txnId: txn_id}
      post_request(@conn, '/api/v1/registration/aadhaar/verifyOTP', payload)
    end
  end

 
end