module OpenStack
module Network
  class FloatingIp

    attr_reader :id
    attr_reader :floating_network_id
    attr_reader :port_id
    attr_reader :tenant_id
    attr_reader :router_id
    attr_reader :fixed_ip_address
    attr_reader :floating_ip_address
    attr_reader :status
    attr_reader :description
    attr_reader :revision_number

    def initialize(ip_info={})
      @id                  = ip_info["id"]
      @floating_network_id = ip_info["floating_network_id"]
      @port_id             = ip_info["port_id"]
      @tenant_id           = ip_info["tenant_id"]
      @router_id           = ip_info["router_id"]
      @fixed_ip_address    = ip_info["fixed_ip_address"]
      @floating_ip_address = ip_info["floating_ip_address"]
      @status              = ip_info["status"]
      @description         = ip_info["description"]
      @revision_number     = ip_info["revision_number"]
    end

  end
end
end
