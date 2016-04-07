@game_options = {1 => "Human v. Human", 2 => "Human v. Computer(Easy)", 3 => "Human v. Computer(Hard)"}

def get_board(spaces)                         # output
  grid_h =  "---+---+---\n"
  i = 0                                       #    1 | 2 | 3
  spaces.each_slice(3) do |row|              #   ---+---+---
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

def init_game_board(spaces)
  puts "Select any number on the board for where you would like to go! \n\n"
  get_board(spaces)
end

def get_player_move(player,spaces,win)
  player_move = gets.chomp.to_i
  until is_valid_move?(player_move,spaces)
    puts "#{player_move} is not a valid option. Please select an available number on the board"
    player_move = gets.chomp.to_i
  end
  set_player_move(player_move, player, spaces)
  set_win_arr(player_move, player,win)
end

  def is_valid_move?(player_move, spaces)
    spaces.any? {|s| s == player_move}
  end

  def set_player_move(player_move, player, spaces)
    spaces[player_move - 1] = player
  end

  def set_win_arr(player_move, player, win)
    win.each do |combo|
      combo.each do |space|
        combo[combo.index(space)] = player if space == player_move
      end
    end

  end
def player_win?(win)
  win.any? {|w| w.uniq.length == 1}
end

def gameboard_full?(turns)
  turns.eql?(0)
end

def game_over?(player, win, turns)
  if turns < 5
    if player_win?(win)
      puts "#{player} wins! Thanks for playing."
      return true
    end
    if gameboard_full?(turns)
      puts "It's a tie! No one wins. :( "
      return true
    end
  end
end

#play random value from @spaces
  def generate_dumb_computer_move(player, spaces, win)
    avail_comp_move = []
    spaces.each do |i|
      avail_comp_move << i if i.class == Fixnum
    end
    comp_move = avail_comp_move.sample
    set_player_move(comp_move, player, spaces)
    set_win_arr(comp_move, player, win)
  end

def switch_turn(player, turns,spaces,win)
  if player == @player1 || @game_mode == 1
    return get_player_move(player,spaces,win)
  end
  if player == @player2
    generate_dumb_computer_move(player, spaces, win) if @game_mode == 2
    #generate_smart_computer_move(player) if @game_mode == 3
  end
end

#TODO play game mode 3 = minimax algorithm...

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

#if there is a winner, winner gets 1 point. Loser get -1 point.
def score(player,turns)
  win = [:w, 1]
  draw = [:d, 0]
  loss = [:l,-1]

  score = {}
  if player_win?(win)
    if player = @player1
      score = {@player1: win, @player2: loss}
    else
      score = {@player1: loss, @player2: win}
    end
  end
  if gameboard_full?(turns)
    score = {@player1: draw, @player2: draw}
    scoreboard_count(score[@player1]) if @game_mode != 1
  end
end

#only if player plays against the Computer
#Win-Loss-Draw scoreboard - displays the count of the numbers of times a player wins, looses and draws.
#score param will an array.
def scoreboard_count(score)
  score_count = {w: 0, l: 0, d: 0}
  score_count.each_key do |k|
    score_count[k] += 1 if k == score[0]
  end
  score_count
end

def generate_scoreboard(score_count)
  score_count = {w: 0, l: 0, d: 0}
  scoreboard = ""
  header = " W | L | D \n"
  horz = "-----------\n"
  score_count.each do |k,v|
    print " #{score_count[k]} "
  end
end

#assigning val from loop...

#output
#  W | L | D
# -----------
#  2  1  3

def play_again?(spaces, win, turns)
  puts "would you like to play again? Select 'Y' or 'N'"
  input = gets.chomp
  until input =~ /^[yn]$/i
    puts"#{input} is not an option. Please select 'Y' or 'N'."
    input = gets.chomp
  end
  if input.upcase == "Y"
    turns = 9
    tic_tac_toe
  else
    puts "Ok. Bye."
  end
end

def game_setup(spaces)
  welcome
  get_game_mode
  select_xo
  init_game_board(spaces)
end

def tic_tac_toe
  spaces = 1.upto(9).to_a
  win = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  turns = 9

  game_setup(spaces)
  player = ""
  until game_over?(player, win, turns) do
    player == @player1 ? player = @player2 : player = @player1
    switch_turn(player, turns,spaces, win)
    turns -= 1
    get_board(spaces)
  end
  play_again?(spaces, win, turns)
end

tic_tac_toe

# TODO:
# minimax -- @game_mode = 3
# class methods for TTT
# refactor play_again and select_xo perhaps...
# high score board... top ten?
# rails app version?
# set private methods?
