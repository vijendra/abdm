# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::FacilityManagement::MasterData do
  it "returns success with valid healthid", :vcr do
    response = described_class.new.get_data("OWNER")
    expect(response).to be_kind_of(Hash)
    expect(response["body"]).to have_key("data")
     
    expect(response["code"]).to eq(200)
  end
 
end
