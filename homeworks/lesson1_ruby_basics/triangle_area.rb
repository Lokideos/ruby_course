# frozen_string_literal: true

class TriangleArea
  def initialize(a, h)
    @a = a
    @h = h
  end

  def calculate_area
    0.5 * @a * @h
  end
end
