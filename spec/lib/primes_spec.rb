require "spec_helper"
require "primes"

describe Primes, ".first" do
  context "with no argument" do
    it "returns the first 10 prime numbers" do
      primes = Primes.first

      expect(primes).to eq([ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ])
    end
  end
end
