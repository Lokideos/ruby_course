# frozen_string_literal: true

class CargoCar < Car
  def initialize(number, type)
    super

    @type = 'cargo'
  end
end
