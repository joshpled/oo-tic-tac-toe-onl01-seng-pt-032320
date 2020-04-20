require 'pry'

class TicTacToe
  attr_accessor :board
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
def initialize
  @board = Array.new(9, " ")
end

def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(index,user_input = "X")
  @board[index] = user_input
end

def position_taken?(index)
  @board[index].include?("X") || @board[index].include?("O")
end

def valid_move?(index)
  index.between?(0,8) && position_taken?(index) == false ? true : false
end

def turn_count
  @board.count("O") + @board.count("X")
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  puts "What's your move?"
  turn = gets
  index = input_to_index(turn)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
   puts "Can't do that!"
   turn = gets
 end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    else
      # do nothing
    end
  end
  return nil
end

def full?
  board.all? { |word| word == "X" || word == "O"}
end

def draw?
  full? == true && won? == nil ? true : false
end

def over?
  draw? == true ? true : false || full? == true && draw? == false ? true : false
end

def winner
  if winner = won?
    a = winner[0]
    board[a]
  end
end

def play
  until over? do
  if winner
    "Congratulations #{winner}"
  elsif draw?
    "DRAW!"
  else
    turn
  end 
end
end

end


# binding.pry
