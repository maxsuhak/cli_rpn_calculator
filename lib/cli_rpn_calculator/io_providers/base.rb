module IOProviders
  class Base
    attr_accessor :options, :logger

    def initialize(options = {}, logger = Logger.new(Helpers::FileLog.name))
      self.options = options
      self.logger  = logger
    end

    def read
      raise NotImplementedError
    end

    def write
      raise NotImplementedError
    end
  end
end
