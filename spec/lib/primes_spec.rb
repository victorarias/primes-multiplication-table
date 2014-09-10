require "spec_helper"
require "primes"

require "prime"

shared_examples "a primes list" do
  before { stub_const("RubyPrime", Prime) }

  context "with an argument" do
    it "returns the first requested primes" do
      count = 1000
      primes = described_class.first(count, native: native)
      ruby_primes = RubyPrime.first(count)

      expect(primes.size).to eq count
      expect(primes).to eq(ruby_primes)
    end
  end
end

describe Primes do
  context "with no argument" do
    it "returns the first 10 primes" do
      primes = described_class.first

      expect(primes).to eq([ 2, 3, 5, 7, 11, 13, 17, 19, 23, 29 ])
    end
  end

  context "with non-native implementation" do
    let(:native) { false }

    it_behaves_like "a primes list"
  end

  context "with implementation" do
    let(:native) { true }

    it_behaves_like "a primes list"
  end
end
