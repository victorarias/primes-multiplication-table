class MultiplicationTable
  class Renderer
    def initialize(table)
      @table = table
    end

    def render
      rendered_header = [ " ", *header ].map { |n| n.to_s.rjust(width) }.join(separator)

      rendered_lines = calculate.map { |line|
        line.map { |n| n.to_s.rjust(width) }.join(separator)
      }.join("\n")

      [ rendered_header, "\n", rendered_lines ].join
    end

    private

    def width
      3
    end

    def separator
      " | "
    end

    def header
      @table.header
    end

    def calculate
      @table.calculate
    end
  end
end
