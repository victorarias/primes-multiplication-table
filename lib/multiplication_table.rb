require "primes"
require "multiplication_table/times"

class MultiplicationTable
  def header
    primes
  end

  def calculate
    primes.map { |prime| Times.of(prime).with(primes) }
  end

  private

  def primes
    @primes ||= Primes.first
  end
end
