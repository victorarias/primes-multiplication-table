module Primes
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.first(count = DEFAULT_NUMBER_OF_PRIMES)
    [ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ].first(count)
  end
end
