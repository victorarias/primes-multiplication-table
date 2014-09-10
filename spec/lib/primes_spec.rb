require "spec_helper"
require "primes"

require "prime"
RubyPrime = Prime

describe Primes, ".first" do
  context "with no argument" do
    it "returns the first 10 primes" do
      primes = Primes.first

      expect(primes).to eq([ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ])
    end
  end

  context "with an argument" do
    it "return the first requested primes" do
      count = 1000
      primes = Primes.first(count)
      ruby_primes = RubyPrime.first(count)

      expect(primes.size).to eq count
      expect(primes).to eq(ruby_primes)
    end
  end
end
