class MultiplicationTable
  class Times
    def self.of(number)
      new(number)
    end

    def initialize(number)
      @number = number
    end

    def with(numbers)
      numbers.map { |n| @number * n }.unshift(@number)
    end
  end
end
