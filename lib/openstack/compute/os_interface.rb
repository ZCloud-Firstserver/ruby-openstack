module OpenStack
module Compute
  class OsInterface
    attr_reader :fixed_ip
    attr_reader :mac_addr
    attr_reader :net_id
    attr_reader :port_id
    attr_reader :port_state

    def initialize(addr_hash)
      @fixed_ips  = addr_hash["fixed_ips"]
      @mac_addr   = addr_hash["mac_addr"]
      @net_id     = addr_hash["net_id"]
      @port_id    = addr_hash["port_id"]
      @port_state = addr_hash["port_state"]
    end
  end
end
end
