require "primes/calculator"

module Primes
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.first(count = DEFAULT_NUMBER_OF_PRIMES)
    Primes::Calculator.new(count ** 2).calculate.first(count)
  end
end
