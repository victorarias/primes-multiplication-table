class MultiplicationTable
  class Renderer
    def initialize(table)
      @table = table
    end

    def render
      rendered_header = format [ " ", *header ]
      rendered_lines = lines.map { |line| format line }

      [ rendered_header, *rendered_lines ].join("\n")
    end

    private

    def width
      @width ||= lines.flatten.max.to_s.size
    end

    def separator
      " | "
    end

    def header
      @table.header
    end

    def lines
      @table.calculate
    end

    def format(values)
      values.map { |n| n.to_s.rjust(width) }.join(separator)
    end
  end
end
