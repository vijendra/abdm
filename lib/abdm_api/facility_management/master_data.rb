module AbdmAPI::V1::FacilityManagement
  class MasterData < AbdmAPI::Base

    def get_short_url
      "#{AbdmAPI.configuration.facility_base_url}/FacilityManagement/v1.5/facility"
    end

    def get_data(api_type)
      response = Faraday.get("#{get_short_url}/get-master-data?type=#{api_type}")
 
      handle_response(response)
    end

    def get_owner_subtype(ownership_code, owner_subtype_code)
      payload = { ownershipCode: ownership_code, ownerSubtypeCode: owner_subtype_code }
      post_request(health_facility_connection, '/FacilityManagement/v1.5/facility/get-owner-subtype', payload)
    end

    def states
      response = Faraday.get("#{get_short_url}/lgd/states")
      handle_response(response)
    end

    def districts(state_code)
      response = Faraday.get("#{get_short_url}/lgd/districts?stateCode=#{state_code}")
      handle_response(response)
    end

    def subdistricts(district_code)
      response = Faraday.get("#{get_short_url}/lgd/subdistricts?districtCode=#{district_code}")
      handle_response(response)
    end

  end
end
