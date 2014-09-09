require 'spec_helper'

describe "Multiplication table CLI" do
  let(:cli_path) { "bin/primes-table" }

  context "with no arguments" do
    it "prints the multiplication table of the first 10 primes" do
      table = run_cli_and_read_output

      expect(table).to eq(<<-EOS
    |   2 |   3 |   5 |   7 |  11 |  13 |  17 |  19 |  23 |  29
  2 |   4 |   6 |  10 |  14 |  22 |  26 |  34 |  38 |  46 |  58
  3 |   6 |   9 |  15 |  21 |  33 |  39 |  51 |  57 |  69 |  87
  5 |  10 |  15 |  25 |  35 |  55 |  65 |  85 |  95 | 115 | 145
  7 |  14 |  21 |  35 |  49 |  77 |  91 | 119 | 133 | 161 | 203
 11 |  22 |  33 |  55 |  77 | 121 | 143 | 187 | 209 | 253 | 319
 13 |  26 |  39 |  65 |  91 | 143 | 169 | 221 | 247 | 299 | 377
 17 |  34 |  51 |  85 | 119 | 187 | 221 | 289 | 323 | 391 | 493
 19 |  38 |  57 |  95 | 133 | 209 | 247 | 323 | 361 | 437 | 551
 23 |  46 |  69 | 115 | 161 | 253 | 299 | 391 | 437 | 529 | 667
 29 |  58 |  87 | 145 | 203 | 319 | 377 | 493 | 551 | 667 | 841
      EOS
    )
    end
  end

  context "with --first 5" do
    it "prints the multiplication table of the first 5 primes" do
      table = run_cli_and_read_output("--first 5")

      expect(table).to eq(<<-EOS
    |   2 |   3 |   5 |   7 |  11
  2 |   4 |   6 |  10 |  14 |  22
  3 |   6 |   9 |  15 |  21 |  33
  5 |  10 |  15 |  25 |  35 |  55
  7 |  14 |  21 |  35 |  49 |  77
 11 |  22 |  33 |  55 |  77 | 121
      EOS
    )
    end
  end

  context "with --first 30" do
    it "prints the multiplication table of the first 30 primes" do
      table = run_cli_and_read_output("--first 30")

      pending "real prime numbers generation"

      expect(table.chomp).to end_with("| 12769")
    end
  end

  def run_cli_and_read_output(args = nil)
    IO.popen("#{cli_path} #{args}") do |io|
      return io.readlines.join
    end
  end
end
