module OpenStack

class Logger
  class << self
    extend Forwardable

    def_delegators :logger, :debug, :info, :warn, :error, :fatal

    def configure(out_path, level: nil, formatter: nil)
      @out_path = out_path
      @level = level
      @formatter = formatter
      @logger = nil
    end

    def logger
      unless @logger
        @logger = ::Logger.new(@out_path)
        @logger.level = ::Logger::SEV_LABEL.index(@level.to_s.upcase) || 0
        @logger.formatter = @formatter
      end
      @logger
    end
  end
end

end
