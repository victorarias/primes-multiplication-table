require "primes"

class MultiplicationTable
  def header
    primes
  end

  def calculate
    primes.map { |prime| TimesTable.of(prime).with(primes) }
  end

  private

  def primes
    @primes ||= Primes.first
  end

  class TimesTable
    def self.of(number)
      TimesTable.new(number)
    end

    def initialize(number)
      @number = number
    end

    def with(numbers)
      numbers.map { |n| @number * n }.unshift(@number)
    end
  end
end
