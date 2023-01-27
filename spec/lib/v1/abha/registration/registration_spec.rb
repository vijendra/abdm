# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Registration do
  it "does something useful", :vcr do
    response = AbdmAPI::V1::Abha::Registration.new.generate_aadhaar_otp("576500577334")
    expect(response).to be_kind_of(Hash)
    expect(response).to have_key("txnId")
    expect(response["txnId"]).to eq("b6c3bfbc-fc04-40aa-97d1-233d9109d47a")
    #expect(AbdmAPI::AbhaNumber.new.generateAadhaarOtp("5765005773342")).not_to be nil
  end
 
end
