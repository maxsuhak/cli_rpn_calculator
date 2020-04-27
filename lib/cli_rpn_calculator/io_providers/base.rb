module IOProviders
  class Base
    def initialize(options = {}, logger = Logger.new(Helpers::FileLog.name))
      @options = options
      @logger  = logger
    end

    def read
      raise NotImplementedError
    end

    def write
      raise NotImplementedError
    end
  end
end
