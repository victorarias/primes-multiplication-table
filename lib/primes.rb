require "primes/primes_enumerable"

module Primes
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.first(count = DEFAULT_NUMBER_OF_PRIMES, native: false)
    calculator(native).first(count)
  end

  def self.calculator(native)
    if native
      PrimesNativeEnumerable.new
    else
      PrimesEnumerable.new
    end
  end
end
