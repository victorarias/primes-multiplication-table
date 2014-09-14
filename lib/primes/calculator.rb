module Primes
  class Calculator
    def initialize
      @known_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]
      @max_checked = @known_primes.last + 1
    end

    def get_nth(position)
      find_more_primes while position >= @known_primes.count

      @known_primes[position]
    end

    private

    # based on ruby's implementation
    # checkout previous revision for the old implementation (01ed507e78d17a8f57e640da5fb9ddd1350f5886)
    def find_more_primes
      candidates_max = @known_primes.last * 2
      candidates = ((@max_checked + 1)..candidates_max).step(2).to_a
      sieving_primes = primes_to_sieve(candidates_max)

      offsets = Array.new(sieving_primes.size) do |i|
        (-(candidates.first + sieving_primes[i]) / 2) % sieving_primes[i]
      end

      sieving_primes.zip(offsets).each do |prime, offset|
        while offset < candidates.size do
          candidates[offset] = nil
          offset += prime
        end
      end

      @known_primes += candidates.compact
      @max_checked = candidates_max
    end

    def primes_to_sieve(up_to)
      sieving_limit = Math.sqrt(up_to).floor.to_i
      @known_primes[1..-1].take_while { |prime| prime <= sieving_limit }
    end
  end
end
