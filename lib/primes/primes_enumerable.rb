require "primes/calculator"
require "primes/native/primes_native_calculator"

module Primes
  class BasePrimesEnumerable
    include Enumerable

    def initialize
      @limit = 10 # initial
      calculate_primes
    end

    def each(&blk)
      loop do
        @primes.each { |prime| blk.call(prime) }
        find_more_primes
      end
    end

    private

    def calculate_primes
      raise "implement me"
    end

    def find_more_primes
      max_found = @primes.last
      @limit = @limit * 2

      # TODO: could be optimized to not recalculate from zero.
      calculate_primes

      remove_primes_up_to(max_found)
    end

    def remove_primes_up_to(number)
      index = @primes.index(number)
      @primes = @primes.slice(index + 1..-1)
    end
  end

  class PrimesEnumerable < BasePrimesEnumerable
    def calculate_primes
      @primes = Primes::Calculator.new(@limit).calculate
    end
  end

  class PrimesNativeEnumerable < BasePrimesEnumerable
    def calculate_primes
      @primes = PrimesNativeCalculator.calculate(@limit)
    end
  end
end
