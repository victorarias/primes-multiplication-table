require "primes/calculator"
require "primes/native/primes_native_calculator"

module Primes
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.first(count = DEFAULT_NUMBER_OF_PRIMES, native: false)
    # TODO: add native calculation
    # TODO: add readme
    calculator(native).first(count)
  end

  def self.calculator(native)
    if native
      PrimesNativeEnumerable.new
    else
      PrimesEnumerable.new
    end
  end

  class PrimesEnumerable
    include Enumerable

    def initialize
      @limit = 10 # initial
      calculate_primes
    end

    def each(&blk)
      loop do
        @primes.each { |prime| blk.call(prime) }
        recalculate_primes
      end
    end

    private

    def calculate_primes
      @primes = Primes::Calculator.new(@limit).calculate
    end

    def recalculate_primes
      max_checked = @primes.last
      @limit = @limit * 2

      # TODO: could be optimized to not recalculate from zero?
      calculate_primes

      old_highest_index = @primes.index(max_checked)
      @primes = @primes.slice(old_highest_index + 1..-1)
    end
  end

  class PrimesNativeEnumerable < PrimesEnumerable
    def calculate_primes
      @primes = PrimesNativeCalculator.calculate(@limit)
    end
  end
end
