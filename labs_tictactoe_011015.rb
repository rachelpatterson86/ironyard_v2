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
    puts grid_h unless i == 3                      #    7 | 8 | 9
  end
  puts "\n"
end

def validation(validate,input,validation_type,player=nil)
  invalid_msg = " is not an option. Please select "
  until validate
    case validation_type
    when 'game_mode'
      puts "#{input}" + invalid_msg + "1, 2, or 3."
      input = gets.chomp.to_i
      validate = @game_options.has_key?(input)
    when 'xo'
      puts "#{input}" + invalid_msg + "'X' or 'O'."
      input = gets.chomp
      validate = input =~ /^[xo]$/i
    when 'game_move'
      puts "#{input}" + invalid_msg + "an available number on the board"
      input = gets.chomp.to_i
      validate = is_valid_move?(input)
      puts "#{validate}"
    end
  end
  validation_end(validation_type,input,player)
end

def validation_end(validation_type,input,player=nil)
  case validation_type #separate into different function....
  when 'game_mode'
    puts "You've selected #{@game_options[input]} mode! Let's get started."
    @game_mode = input
  when 'xo'
    @player1 = input.upcase!
    @player1 == "X" ? @player2 = "O" : @player2 = "X"
    puts "You are '#{@player1}'. Your oppenent is '#{@player2}'."
  when 'game_move'
    set_player_move(input, player)
    set_win_arr(input, player)
    get_board
  end
end

def get_game_mode
  puts "Welcome to Tic Tac Toe: The all American game! \n What Tic Tac Toe game would you like to play? Select 1, 2 or 3"
  @game_options.each do |opt, msg|
    puts "#{opt} is #{msg}"
  end
  user_input = gets.chomp.to_i
  validate = @game_options.has_key?(user_input)
  validation(validate,user_input,"game_mode")
  select_xo
end

def select_xo
  puts "But first... do you want to be 'X' or 'O'?"
  user_input = gets.chomp
  validate = user_input =~ /^[xo]$/i
  validation(validate,user_input,"xo")
  puts "Select any number on the board for where you would like to go! \n"
  get_board
  get_player_move(@player1)
end

def get_player_move(player)
  player_move = gets.chomp.to_i
  validate = is_valid_move?(player_move)
#  puts "#{validate} from get player move"
  validation(validate,player_move,'game_move',player)
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
        if space == player_move
          combo[combo.index(space)] = player
        end
      end
    end
  end

def player_win?
  @win.any? {|w| w.uniq.length == 1}
end

def gameboard_full?
  @turns.eql?(0)
end

def game_over?(player)
  if @turns < 5 && player_win?
    puts "#{player} wins! Thanks for playing."
    return true
  elsif gameboard_full?
    puts "Board is full and it's a tie! Thanks for playing."
    return true
  end
end

def play_game_mode_1(player)
  get_player_move(player)
end

def play_game_mode_2(player)
  if player == @player1
    get_player_move(player)
  else
    generate_dumb_computer_move(player)
  end
end

  def generate_dumb_computer_move(player)      #play random value from @spaces
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

def tic_tac_toe
  get_game_mode
  player = @player1
  @turns -= 1
  until game_over?(player) do
    @turns -= 1
    player == @player1 ? player = @player2 : player = @player1
      if @game_mode == 1
        play_game_mode_1(player)
      elsif @game_mode == 2
        play_game_mode_2(player)
      else
        play_game_mode_3(player)
      end
    get_board
  end
end

tic_tac_toe
