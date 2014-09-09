module Primes
  class Calculator
    def initialize(limit)
      @limit = limit
    end

    # implementation of the sieve of Eratosthenes
    # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
    def calculate
      elements = (0..limit).to_a
      elements[0] = elements[1] = nil

      elements.each do |elem|
        next unless elem
        break if (elem_square = elem ** 2) > limit

        elem_square.step(limit, elem) { |step| elements[step] = nil }
      end

      elements.compact
    end

    private

    attr_reader :limit
  end
end
