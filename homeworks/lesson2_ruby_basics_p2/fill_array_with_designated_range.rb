class FillArrayWithDesignatedRange
  RANGE = (10..100)

  def self.iterate(step)
    array = RANGE.map { |number| number if number % 5 == 0 }
    array.compact
  end
end