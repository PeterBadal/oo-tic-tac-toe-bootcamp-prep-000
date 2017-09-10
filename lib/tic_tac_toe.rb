class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
=begin
    def turn_count
      @board.count{|token| token == "X" || token == "O"}
    end
=end

def turn_count
  counter = 0
  @board.each do |element|
    if element == "O" ||element == "X"
      counter += 1
    end
    end
    counter
    end

def current_player
   turn_count % 2 == 0 ? "X" : "O"
 end

 def won?
   WIN_COMBINATIONS.each do |win_combo| # win_combo is same as WIN_COMBINATIONS[0][1][2]
     if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]]== "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
      return win_combo
     end
     end
     return false
 end

 def full?
   @board.all? do |element|
     element == "X" || element == "O"
 end
 end

 def draw?
   !won? && full?
 end

 def over?
   won? || draw?
 end

 def winner
   if won?
      #@board[won?(@board[0]]
      WIN_COMBINATIONS.each do |win_combo| # win_combo is same as WIN_COMBINATIONS[0][1][2]
        if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]]== "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
         return @board[win_combo[0]]
        end
      end
    end
 end

 def draw?
   !won? && full?
 end

 def over?
   won? || draw?
 end

 def play
   until over?
     turn
   end
     #move(current_player(board), input_to_index())
   if won?
     puts("Congratulations #{winner}!")
   elsif draw?
   puts("Cat's Game!")
 end
 end

 def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

end
# we have game which will be the board array
# won?(game) will be either false, or an array (for example: [0,1,2])
# we can't grab a value of an index for false
