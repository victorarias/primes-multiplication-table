require "spec_helper"
require "multiplication_table"
require "primes"

describe MultiplicationTable, "#header" do
  let(:number_of_primes) { 3 }
  let(:primes) { Primes.first(number_of_primes) }
  let(:table) { MultiplicationTable.new(primes) }

  it "is a the list of primes" do
    expect(table.header).to eq(Primes.first(number_of_primes))
  end
end

describe MultiplicationTable, "#calculate" do
  let(:primes) { Primes.first(10) }
  let(:table) { MultiplicationTable.new(primes) }
  let(:number_of_primes) { primes.count }

  it "is the times table of the first given primes with themselves" do
    lines = table.calculate

    expect(lines.count).to eq(number_of_primes)

    primes.zip(lines).each do |prime, multiples|
      expect(multiples).to eq(MultiplicationTable::Times.of(prime).with(primes))
    end
  end
end

describe MultiplicationTable, "#render" do
  let(:primes) { Primes.first(10) }
  let(:table) { MultiplicationTable.new(primes) }

  it "renders the table" do
    expect(table.render).to match /<<-EOS
    |   2 |   3 |   5 |   7 |  11 |  13 |  17 |  19 |  23 |  29
  2 |   4 |   6 |  10 |  14 |  22 |  26 |  34 |  38 |  46 |  58
  3 |   6 |   9 |  15 |  21 |  33 |  39 |  51 |  57 |  69 |  87
      EOS
    /

    expect(table.render + "\n").to match /<<-EOS
  19 |  38 |  57 |  95 | 133 | 209 | 247 | 323 | 361 | 437 | 551
  23 |  46 |  69 | 115 | 161 | 253 | 299 | 391 | 437 | 529 | 667
  29 |  58 |  87 | 145 | 203 | 319 | 377 | 493 | 551 | 667 | 841
EOS
    /
  end
end
