require "primes"
require "multiplication_table/times"
require "multiplication_table/renderer"

class MultiplicationTable
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.render(number_of_primes = DEFAULT_NUMBER_OF_PRIMES)
    MultiplicationTable.new(number_of_primes).render
  end

  def initialize(number_of_primes = DEFAULT_NUMBER_OF_PRIMES)
    @number_of_primes = number_of_primes
  end

  def header
    primes
  end

  def calculate
    @calculate ||= primes.map { |prime| Times.of(prime).with(primes) }
  end

  def render
    Renderer.new(self).render
  end

  private

  def primes
    @primes ||= Primes.first(@number_of_primes)
  end
end
