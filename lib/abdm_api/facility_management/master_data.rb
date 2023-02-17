module AbdmAPI::FacilityManagement
  class MasterData < AbdmAPI::Base

    def get_data(params_type)
      response = Faraday.get("#{AbdmAPI.configuration.facility_base_url}/FacilityManagement/v1.5/facility/get-master-data?#{params_type}")
      JSON.parse(response.body)
    end

  end
end