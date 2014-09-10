module Primes
  class Calculator
    def initialize(up_to)
      @up_to = up_to
    end

    # implementation of the sieve of Eratosthenes
    # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
    def calculate
      candidates = (0..up_to).to_a
      candidates[0] = candidates[1] = nil

      candidates.each do |candidate|
        next unless candidate
        break if (candidate_square = candidate ** 2) > up_to

        candidate_square.step(up_to, candidate) do |step|
          candidates[step] = nil
        end
      end

      candidates.compact
    end

    private

    attr_reader :up_to
  end
end
