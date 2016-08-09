module OpenStack

class Logger
  class << self
    extend Forwardable

    def_delegators :logger, :debug, :info, :warn, :error, :fatal

    def configure(out_path, level: nil)
      @out_path = out_path
      @level = level
      @logger = nil
    end

    def logger
      unless @logger
        @logger = ::Logger.new(@out_path)
        @logger.level = ::Logger::SEV_LABEL.index(@level.to_s.upcase) || 0
      end
      @logger
    end
  end
end

end

OpenStack::Logger.configure(STDOUT)
OpenStack::Logger.info ""

