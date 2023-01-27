# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Registration do
  it "returns success with valid aadhaar", :vcr do
    response = AbdmAPI::V1::Abha::Registration.new.generate_aadhaar_otp("576500577334")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]).to have_key("txnId")
    expect(response["body"]["txnId"]).to eq("e6e792e3-7011-4d91-bc6b-02a0e59bbecf")
    expect(response["code"]).to eq(200)
  end
 
  it "returns failure with invalid aadhaar", :vcr do
    response = AbdmAPI::V1::Abha::Registration.new.generate_aadhaar_otp("12345")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]["message"]).to eq("Request is invalid. Please enter the correct data.")
    expect(response["code"]).to eq(400)
  end
end
