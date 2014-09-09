require "spec_helper"
require "multiplication_table"
require "primes"

describe MultiplicationTable, "#header" do
  let(:table) { MultiplicationTable.new }

  it "is a the list of the first 10 primes" do
    primes = Primes.first

    expect(table.header).to eq(primes)
  end
end

describe MultiplicationTable, "#calculate" do
  let(:table) { MultiplicationTable.new }
  let(:primes) { Primes.first }

  it "is the times table of the first 10 primes with themselves" do
    lines = table.calculate

    expect(lines.count).to eq(10)

    primes.zip(lines).each do |prime, multiples|
      expect(multiples).to eq(MultiplicationTable::Times.of(prime).with(primes))
    end
  end
end
