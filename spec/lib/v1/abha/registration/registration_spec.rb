# frozen_string_literal: true

RSpec.describe AbdmAPI::V1::Abha::Registration do
  it "has a version number", :vcr do
    response = AbdmAPI::V1::Abha::Registration.new.generateAadhaarOtp("5765005773342")
    expect(response).to be_kind_of(Hash)
    expect(response).to have_key(:status)
    expect(response).to have_key(:data)
    #expect(AbdmAPI::AbhaNumber.new.generateAadhaarOtp("5765005773342")).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
