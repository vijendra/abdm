# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Authentication do
  it "returns success with valid healthid", :vcr do
    response = described_class.new.init_auth("91-4000-5003-5536", "AADHAAR_OTP")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]).to have_key("txnId")
    expect(response["body"]["txnId"]).to eq("a798efbc-2759-4c0d-bd3a-4c2b28c31a6d")
    expect(response["code"]).to eq(200)
  end
 
  it "returns failure with invalid healthid", :vcr do
    response = described_class.new.init_auth("91-4000-5003-55361", "AADHAAR_OTP")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]["message"]).to eq("Unable to process the current request due to incorrect data entered.")
    expect(response["code"]).to eq(422)
  end
end
