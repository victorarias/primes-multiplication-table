require 'cli_options'
require "multiplication_table"

class MultiplicationTableCli
  def self.run
    new.run
  end

  def run
    options = CLIOptions.new(ARGV)

    puts MultiplicationTable.render(options.number_of_primes)
  end
end
