class RightTriangle
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end  

  def is_right?
    @hypotenuse**2 == @catheter1**2 + @catheter2**2
  end

  def is_isosceles?
    @catheter1 == @catheter2
  end

  def is_equilateral?
    @hypotenuse == @catheter1 && @hypotenuse == @catheter2
  end

  def name_right_triangle_sides
    if @a >= @b && @a >= @c
      @hypotenuse = @a
      @catheter1 = @b
      @catheter2 = @c
    elsif @b >= @a && @b >= @c
      @hypotenuse = @b
      @catheter1 = @a
      @catheter2 = @c
    else
      @hypotenuse = @c
      @catheter1 = @a
      @catheter2 = @b
    end
  end
end
