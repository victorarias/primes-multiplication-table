require "spec_helper"
require "cli_options"

describe CLIOptions, "#number_of_primes" do
  it "is 10 by default" do
    options = CLIOptions.new

    expect(options.number_of_primes).to eq(10)
  end

  context "with '--first 5'" do
    let(:args) { [ "--first", "5" ] }

    it "is 5" do
      options = CLIOptions.new(args)

      expect(options.number_of_primes).to eq(5)
    end
  end
end

describe CLIOptions, "#native?" do
  it "is false by default" do
    options = CLIOptions.new

    expect(options.native?).to eq(false)
  end

  context "with '--native'" do
    let(:args) { [ "--native" ] }

    it "is true" do
      options = CLIOptions.new(args)

      expect(options.native?).to eq(true)
    end
  end
end
