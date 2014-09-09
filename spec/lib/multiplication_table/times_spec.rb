require "spec_helper"
require "multiplication_table/times"

describe MultiplicationTable::Times, "#with" do
  it "multiplies the number with the given arguments" do
    times = MultiplicationTable::Times.of(2)

    expect(times.with([ 2, 3, 4 ])).to eq([ 2, 4, 6, 8 ])
  end
end
