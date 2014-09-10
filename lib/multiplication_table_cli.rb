require "cli_options"
require "multiplication_table"
require "primes"

class MultiplicationTableCli
  def self.run
    new.run
  end

  def run
    puts MultiplicationTable.render(primes)
  end

  private

  def options
    @options ||= CLIOptions.new(ARGV)
  end

  def primes
    Primes.first(options.number_of_primes, native: options.native?)
  end
end
