class MultiplicationTable
  class Renderer
    def initialize(table)
      @table = table
    end

    def render
      rendered_header = format [ " ", *header ]
      rendered_lines = calculate.map { |line| format line }

      [ rendered_header, *rendered_lines ].join("\n")
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

    def format(values)
      values.map { |n| n.to_s.rjust(width) }.join(separator)
    end
  end
end
