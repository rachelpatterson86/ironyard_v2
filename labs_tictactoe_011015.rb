require 'pry'

@game_options = {"1" => "Human v. Human", "2" => "Human v. Computer(Easy)", "3" => "Human v. Computer(Hard)"}
# change $grid (SPACES) from hash to array. The data set is small so using hashes adds un-needed complexity.
#$grid = {"A1" => " ","A2" => " ","A3" => " ","B1" => " ","B2" => " ","B3" => " ","C1" => " ","C2" => " ","C3" => " "}
@spaces = 1.upto(9).to_a
@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
@game_mode
@turn

def greeting
  puts "Welcome to Tic Tac Toe: The all American game!"
end

def get_game_mode
  puts "What Tic Tac Toe game would you like to play? Select 1, 2 or 3"
  @game_options.each do |opt, msg|
    puts "#{opt} is #{msg}"
  endcmd
  user_input = gets.chomp

  until @game_options.has_key?(user_input)
    puts "#{user_input} is not an option. Please select 1, 2, or 3."
    user_input = gets.chomp
  end
  puts "You've selected #{@game_options[user_input]} mode! Let's get started."

end

def print_rules

  if @game_mode == 1
    puts "Player 1, you're X"
    puts "Player 2, you're O"
  elsif @game_mode == 2
    puts "Human, you're X"
  else
    puts "Human, you're O"
  end
  puts "Make your selection by letter and number."
  puts "For example, A1 = top left square, C3 = bottom right."
end

def get_board
  grid_h =  "---+---+---\n"
  @spaces.each_slice(3) do |row|
    puts ' ' + row.join(' | ')
    if row != @spaces.last(3)
      puts grid_h
    end
  end

# output
#    1 | 2 | 3
#   ---+---+---
#    4 | 5 | 6
#   ---+---+---
#    7 | 8 | 9

 end

 def game_over?
      if gameboard_full? || horizontal_win? || vertical_win? || diagonal_win?
     return true
      end
   return false
  end

 def gameboard_full?
   unless @spaces.has_value?(" ")
   return true
  end
   return false
 end

def player_win?(player)
end

 def get_player_move(is_player_1)
 puts "Make your move, " + (is_player_1 ? "player 1." : "player 2.")
 player_move = gets.chomp
 until is_valid_move?(player_move) && ! is_move_already_played?(player_move)
 puts "#{player_move} is not a valid option. Try again."
 player_move = gets.chomp
 end
 return player_move
 end

 def is_valid_move?(player_move)
 if player_move == 'A1' || player_move == 'A2' || player_move == 'A3'
 return true
elsif player_move == 'B1' || player_move == 'B2' || player_move == 'B3'
 return true
elsif player_move == 'C1' || player_move == 'C2' || player_move == 'C3'
 return true
 end
 return false
 end

def is_move_already_played?(player_move)
 #is this space already taken by another player?
 if @spaces[player_move] == " "
 return false
 end
 return true
end

 def set_player_move(player_move, player)
 if @spaces[player_move] == " "
     @spaces[player_move] = player
   else
     puts "There is already a play in square #{player_move}. #{player} loses a turn."
   end

 end

def play_game_mode_1
  player_1_turn = true

  until game_over?
    get_board
    player_move = get_player_move(player_1_turn)
    set_player_move(player_move, (player_1_turn ? 'X' : 'O'))
    if player_1_turn
      player_1_turn = false
    else
      player_1_turn = true
    end #end if
  end#end until

  get_board

  if player_win?('X')
    puts "Player 1 wins!"
  elsif player_win?('O')
    puts "Player 2 wins!"
  elsif gameboard_full?
    puts "It's a draw."
  else
    puts "How did this happen?!"
  end
end

def play_game_mode_2
  human_turn = true

  until game_over?
    get_board
    if human_turn
      player_move = get_player_move(human_turn)
      set_player_move(player_move, 'X')
    else
      player_move = generate_dumb_computer_move
      set_player_move(player_move, 'O')
    end

    if human_turn
      human_turn = false
    else
      human_turn = true
    end #end if
  end #end until

  get_board

  if player_win?('X')
    puts "Human wins! (Of course)"
  elsif player_win?('O')
    puts "Computer wins! (Are you even trying, human?)"
  elsif gameboard_full?
    puts "It's a draw. (Come on, human. You can do better.)"
  else
    puts "How did this happen?!"
  end

end

  def generate_dumb_computer_move
    #play the first available space
    @spaces.each do |key, value|
      if value == " "
        return key
      end
    end
  end
end

def tic_tac_toe
  greeting
  get_game_mode
  print_rules
  if @game_mode == 1
    play_game_mode_1
  else
    play_game_mode_2
  end
end#end tic_tac_toe

tic_tac_toe
