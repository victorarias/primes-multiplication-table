require "optparse"

class CLIOptions
  def initialize(args = [])
    parse_args(args)
  end

  def number_of_primes
    @number_of_primes || 10
  end

  private

  def parse_args(args)
    parser = OptionParser.new
    parser.on("-f", "--first [NUMBER_OF_PRIMES]", "Number of primes to use") { |number| @number_of_primes = Integer(number) }
    parser.parse(args)
  end
end
