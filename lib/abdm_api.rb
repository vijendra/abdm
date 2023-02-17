require "abdm_api/version"
require "abdm_api/base"
require "abdm_api/v1/abha/registration"
require "abdm_api/v1/abha/authentication"
require "abdm_api/v1/abha/search"

module AbdmAPI
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield(configuration) if block_given?
    
    api_version = 'v1' if api_version.nil? || api_version.empty?
    raise AbdmAPI::Error.new('client_id cannot be blank') if configuration.client_id.nil? || configuration.client_id.empty?
    raise AbdmAPI::Error.new('client_secret cannot be blank') if configuration.client_secret.nil? || configuration.client_secret.empty?
    raise AbdmAPI::Error.new('api_base_url cannot be blank') if configuration.api_base_url.nil? || configuration.api_base_url.empty?
    raise AbdmAPI::Error.new('facility_base_url cannot be blank') if configuration.facility_base_url.nil? || configuration.facility_base_url.empty?
  end

  class Configuration
    attr_accessor :client_id, :client_secret, :api_base_url, :facility_base_url

    def initialize
      @client_id = client_id
      @client_secret = client_secret
      @api_base_url = api_base_url
      @facility_base_url = facility_base_url
    end
  end
 
  class Error < StandardError; end
end
