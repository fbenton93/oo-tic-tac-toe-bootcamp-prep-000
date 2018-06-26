class TicTacToe
  def initialize
    board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @board = board
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index_value = input.to_i - 1
    return index_value
  end
  
  def move(index_value,player = "X")
    @board[index_value] = player
    return @board
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if !(position_taken?(index)) && index.between?(0,8)
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index)
      display_board
    else
      puts "Invalid response. Try again."
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    counter = turn_count
    if counter % 2 == 0
      player = "X"
      return player
    else
      player = "O"
      return player
    end
  end
  
end