module Helpers
  class FileLog
    class << self
      def name
        if ENV['PRODUCTION']
          'tmp/production.log'
        else
          ENV['TEST'] ? 'tmp/test.log' : 'tmp/development.log'
        end
      end
    end
  end
end
