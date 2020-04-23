class Terminal
  def read
    STDOUT.print '> '
    STDIN.gets&.chomp&.strip
  rescue SystemExit, Interrupt
    'q'
  end

  def write(str)
    str = str.to_f if str.is_a?(BigDecimal)

    STDOUT.puts str
  end
end
