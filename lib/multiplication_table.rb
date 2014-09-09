require "primes"
require "multiplication_table/times"
require "multiplication_table/renderer"

class MultiplicationTable
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
    @primes ||= Primes.first
  end
end
