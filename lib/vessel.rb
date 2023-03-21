class Vessel
  attr_reader :name, :volume

  def initialize(name, volume)
    @name = name
    @volume = volume
    @level = 0
  end

  def empty?
    @level.zero?
  end

  def fill
    @level = @volume
  end
end
