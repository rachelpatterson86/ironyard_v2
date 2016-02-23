@game_options = {1 => "Human v. Human", 2 => "Human v. Computer(Easy)", 3 => "Human v. Computer(Hard)"}
@spaces = 1.upto(9).to_a
@win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
@turns = 9

def get_board                                 # output
  grid_h =  "---+---+---\n"
  i = 0                                       #    1 | 2 | 3
  @spaces.each_slice(3) do |row|              #   ---+---+---
    i += 1                                    #    4 | 5 | 6
    puts ' ' + row.join(' | ')                #   ---+---+---
    puts grid_h unless i == 3                 #    7 | 8 | 9
  end
  puts "\n"
end

def welcome
  puts "Welcome to Tic Tac Toe: The all American game! \nWhat Tic Tac Toe game would you like to play? Select 1, 2 or 3"
end

def get_game_mode
  @game_options.each do |opt, msg|
    puts "#{opt} is #{msg}"
  end
  input = gets.chomp
  until @game_options.has_key?(input.to_i)
    puts "#{input} is not an option. Please select 1, 2, or 3."
    input = gets.chomp
  end
  assign_game_mode(input)
end

def assign_game_mode(input)
  puts "You've selected #{@game_options[input]} mode! Let's get started.\n\n"
  @game_mode = input.to_i
end

def select_xo
  puts "But first... do you want to be 'X' or 'O'?"
  input = gets.chomp
  until input =~ /^[xo]$/i
    puts"#{input} is not an option. Please select 'X' or 'O'."
    input = gets.chomp
  end
  assign_player_xo(input)
end

  def assign_player_xo(input)
    @player1 = input.upcase!
    @player1 == "X" ? @player2 = "O" : @player2 = "X"
    puts "You are '#{@player1}'. Your oppenent is '#{@player2}'.\n\n"
  end

def init_game_board
  puts "Select any number on the board for where you would like to go! \n\n"
  get_board
end

def get_player_move(player)
  player_move = gets.chomp.to_i
  until is_valid_move?(player_move)
    puts "#{player_move} is not a valid option. Please select an available number on the board"
    player_move = gets.chomp.to_i
  end
  set_player_move(player_move, player)
  set_win_arr(player_move, player)
end

  def is_valid_move?(player_move)
    @spaces.any? {|s| s == player_move}
  end

  def set_player_move(player_move, player)
    @spaces[player_move - 1] = player
  end

  def set_win_arr(player_move, player)
    @win.each do |combo|
      combo.each do |space|
        combo[combo.index(space)] = player if space == player_move
      end
    end
  end

def player_win?
  @win.any? {|w| w.uniq.length == 1}
end

def gameboard_full?
  @turns.eql?(0)
end

def game_over?
  #puts "game over: player is #{player}"
  (player_win? || gameboard_full?) if @turns < 5
    #puts "#{player} wins! Thanks for playing."
end

  def generate_dumb_computer_move(player) #play random value from @spaces
    avail_comp_move = []
    @spaces.each do |i|
      if i.class == Fixnum
        avail_comp_move << i
      end
    end
    comp_move = avail_comp_move.sample
    set_player_move(comp_move, player)
    set_win_arr(comp_move, player)
  end

def turns(player)
  @turns -= 1
  return get_player_move(player) if @game_mode == 1 || player == @player1
  if player == @player2
    generate_dumb_computer_move(player) if @game_mode == 2
    #generate_smart_computer_move(player) if game_mode == 3
  end
end

#TODO play game mode 3 = minimax algorithm...
# def play_game_mode_3(player)
#   if player == @player1
#     get_player_move(player)
#   else
#     generate_smart_computer_move
#   end
# end
#
#   def generate_smart_computer_move(player)      #play random value from @spaces
#     avail_comp_move = []
#     @spaces.each do |i|
#       if i.class == Fixnum
#         avail_comp_move << i
#       end
#     end
#     comp_move = avail_comp_move.sample
#     set_player_move(comp_move, player)
#   end

def game_setup
  welcome
  get_game_mode
  select_xo
  init_game_board
end

def tic_tac_toe
  game_setup
  player = ""
  puts "player is #{player}"
  until game_over? do
    player == @player1 ? player = @player2 : player = @player1
    turns(player)
    get_board
  end
end

tic_tac_toe
