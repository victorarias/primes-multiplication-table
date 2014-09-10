require "optparse"

class CLIOptions
  def initialize(args = [])
    @options = defaults.merge parse_args(args)
  end

  def number_of_primes
    @options.fetch(:number_of_primes)
  end

  def native?
    @options.fetch(:native?)
  end

  private

  def defaults
    {
      number_of_primes: 10,
      native?: false
    }
  end

  def parse_args(args)
    opts = {}

    OptionParser.new.tap do |parser|
      parser.on("-f", "--first [NUMBER_OF_PRIMES]", "Number of primes to use") { |number| opts[:number_of_primes] = Integer(number) }
      parser.on("-n", "--native", "Use native primes calculator") { opts[:native?] = true }

      parser.parse(args)
    end

    opts
  end
end
