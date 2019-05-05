require_relative "card"
class Board
  attr_reader :board,:popArr
  def initialize
    @board = []
    3.times do
      @board << [nil,nil,nil,nil]
    end
    self.populate
  end

  def populate
    @popArr = []
    6.times do
      @popArr << Card.new
    end
    i=0
    while @popArr.length <12
      newCard = Card.new
      if @popArr[i].value == newCard.value
        @popArr << newCard
        i +=1
      end
    end
    @popArr.shuffle!
    @board.each do |row|
      row.each_with_index do |val,index|
        row[index] = @popArr.pop
      end
    end
  end

  def render
    @boardRender=[]
    3.times do
      @boardRender<< [nil,nil,nil]
    end

    @board.each_with_index do |row,index1|
      row.each_with_index do |val,index2|
        if val.faceUp
          @boardRender[index1][index2] = val.value
        else
          @boardRender[index1][index2] = nil
        end
      end
    end
    p @boardRender
  end

  def won?
    @board.each do |row|
      row.each do |val|
        unless val.faceUp
          return false
        end
      end
    end
    true
  end

  def reveal
    puts "Please enter a position e.g. (2,3)"
    input = gets.chomp
    numberStrings = input.split(",")
    position = []
    numberStrings.each do |str|
      position << str.to_i
    end

    if !@board[position[0]][position[1]].faceUp
      @board[position[0]][position[1]].reveal
      return @board[position[0]][position[1]]
    else
      puts "That card has already been revealed, please guess again"
      self.reveal
    end
  end

end
