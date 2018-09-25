# frozen_string_literal: true

class QuadraticEquation
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def calculate_discriminant
    @D = @b**2 - 4 * @a * @c
  end

  def calculate_roots
    d_part = Math.sqrt(@D) / 2 / @a if @D > 0
    return [-@b + d_part, -@b - d_part] if @D > 0

    -@b / 2 / @a if @D == 0
  end
end
