module AbdmAPI::V1::FacilityManagement
  class MasterData < AbdmAPI::Base

    def get_data(params_type)
      response = Faraday.get("#{AbdmAPI.configuration.facility_base_url}/FacilityManagement/v1.5/facility/get-master-data?type=#{params_type}")
 
      handle_response(response)
    end

  end
end
