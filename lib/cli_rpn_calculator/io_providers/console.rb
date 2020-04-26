module IOProviders
  class Console < Base
    def read
      STDOUT.print '> '
      str = STDIN.gets&.chomp&.strip
      logger.info("> #{str}")
      str
    rescue SystemExit, Interrupt
      logger.info('> q')
      'q'
    end

    def write(str, type = 'info')
      str = str.to_f if str.is_a?(BigDecimal)

      logger.send(type, str)
      STDOUT.puts str
    end
  end
end
