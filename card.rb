class Card
  attr_reader :value,:faceUp
  @@posibilities = ["1","2","3","4","5","6","7","8","9","J","Q","K","A"]

  def initialize
    @value = @@posibilities[rand(0..12)]
    @faceUp = false
  end

  def hide
    @faceUp = false
  end

  def reveal
    @faceUp = true
  end

end
