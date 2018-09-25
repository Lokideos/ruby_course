# frozen_string_literal: true

class IdealWeight
  def initialize(name, height)
    @name = name
    @height = height
  end

  def calculate_and_show_weight_issues
    ideal_weight = @height - 110
    ideal_weight >= 0 ? "Dear #{@name}! Your ideal weight is #{ideal_weight}." : "Dear #{@name}! Your weight is fine! Keep up the good work!"
  end
end
