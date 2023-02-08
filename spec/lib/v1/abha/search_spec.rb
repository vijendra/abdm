# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Search do
  it "returns success with valid healthid", :vcr do
    response = described_class.new.search_by_healthid("91-4000-5003-5536")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]).to have_key("status")
    expect(response["body"]["status"]).to eq("ACTIVE")
    expect(response["code"]).to eq(200)
  end
 
  it "returns failure with invalid healthid", :vcr do
    response = described_class.new.search_by_healthid("91-4000-5003-55361")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]["message"]).to eq("Unable to process the current request due to incorrect data entered.")
    expect(response["code"]).to eq(422)
  end
end
