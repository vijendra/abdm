# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Registration do
  it "does something useful", :vcr do
    response = AbdmAPI::V1::Abha::Registration.new.generate_aadhaar_otp("5765005773341")
    expect(response).to be_kind_of(Hash)
    expect(response).to have_key("txnId")
    expect(response["txnId"]).to eq("8ae2a51f-d807-4fcb-85d9-c5a0fd776050")
  end
 
end
