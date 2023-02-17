module AbdmAPI::V1::FacilityManagement
  class MasterData < AbdmAPI::Base

    def get_data(params_type)
      response = Faraday.get("#{AbdmAPI.configuration.facility_base_url}/FacilityManagement/v1.5/facility/get-master-data?type=#{params_type}")
 
      handle_response(response)
    end

    def get_owner_subtype(ownership_code, owner_subtype_code)
      payload = { ownershipCode: ownership_code, ownerSubtypeCode: owner_subtype_code }
      post_request(health_facility_connection, '/FacilityManagement/v1.5/facility/get-owner-subtype', payload)
    end

  end
end
