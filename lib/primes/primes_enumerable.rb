require "primes/calculator"
require "primes/native/primes_native_calculator"

module Primes
  class BasePrimesEnumerable
    include Enumerable

    def each(&blk)
      idx = 0

      loop do
        blk.call(get_nth_prime(idx))
        idx += 1
      end
    end
  end

  class PrimesEnumerable < BasePrimesEnumerable
    def initialize
      @calculator = Primes::Calculator.new
    end

    private

    def get_nth_prime(position)
      calculator.get_nth(position)
    end

    attr_reader :calculator
  end

  class PrimesNativeEnumerable < BasePrimesEnumerable
    INITIAL_LIMIT = 29

    def initialize
      @primes = PrimesNativeCalculator.calculate(INITIAL_LIMIT)
    end

    def get_nth_prime(position)
      while position >= @primes.count
        @primes = PrimesNativeCalculator.calculate(@primes.last * 2)
      end

      @primes[position]
    end
  end
end
