module AbdmAPI::V1
  module Abha
    class Search < AbdmAPI::Base
      def initialize(conn = nil)
        @conn = conn || connection
      end
  
      def search_by_mobile(payload)
        #payload = {gender: gender, mobile: mobile, name: name, yearOfBirth: year_of_birth}
        post_request(@conn, '/api/v1/search/searchByMobile', payload)
      end
 
      def search_by_healthid(payload)
        #payload = {healthId: health_id}
        post_request(@conn, '/api/v1/search/searchByHealthId', payload)
      end

      def search_by_all_healthid(payload)
        #payload = {healthId: health_id}
        post_request(@conn, '/api/v1/search/existsByHealthId', payload)
      end
    end
  end
end
