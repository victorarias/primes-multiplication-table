require "multiplication_table/times"
require "multiplication_table/renderer"

class MultiplicationTable
  DEFAULT_NUMBER_OF_PRIMES = 10

  def self.render(primes)
    MultiplicationTable.new(primes).render
  end

  def initialize(primes)
    @primes = primes
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

  attr_reader :primes
end
