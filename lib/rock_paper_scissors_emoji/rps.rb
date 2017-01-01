require 'io/console'
require_relative('players.rb')

class RPS

  # game = RPS.new to start programme

  def initialize
    @moves = ['r', 'p', 's']
    @emojify = {'r' => '👊 ', 'p' => '🖐 ', 's' => '✌️ ' }
    @playmode = ''
    @points = 0
    @gamewidth = 70
    @computer_win = ['Computer!-Oh hey, that\'s me!', 'meeeeeeeeeeeeee! 👾 ', 'not you :(', 'Computer']
    main_menu
  end

  def main_menu
    # welcome message
    welcome
    puts

    # validate player mode
    get_playmode until valid_mode?(@playmode)
    puts

    # provide user feedback on their chosen game mode
    mode_confirmation(@playmode)
    puts

    # get number of points required to win
    get_points
    puts

    # create players
    @player1 = create_player(1)
    puts

    @player2 = @playmode == '2'? create_player(2) : create_computer
    puts
    play

  end

  def play
    run_game until game_over?
    puts "The winner is #{winner == @player1? 'you!' : @computer_win.sample}\n\n" if @playmode == '1'
    puts "Congratulations, #{winner.name}! You've won! \n\n" if @playmode == '2'
    reset_moves
    reset_player_points
    play_again
  end

  def valid_move?(move)
    quit?(move)
    move == 'r' || move == 'p' || move == 's'
  end

  def quit?(key)
    exit if key == 'q' || key == 'quit'
  end

  def get_move(player, secret=false)
    # secret tells us if the input should be hidden
    puts "Choose a move!"
    puts "Enter 'r' for rock, 'p' for paper, and 's' for scissors"
    until valid_move?(player.move)
      print "#{player.name}: "
      if !secret
        player.move = gets.chomp
      end
      player.move = STDIN.noecho(&:gets).chomp if secret
    end
  end

  def winner
    if @player1.move == 's' && @player2.move == 'p' || @player1.move == 'p' && @player2.move == 'r' || @player1.move == 'r' && @player2.move == 's'
      return @player1
    end
    @player2
  end

  def computer_move
    @player2.move = @moves.sample
    puts "Computer: #{@player2.move}"
  end

  def run_game
    until round_over?
      if @playmode == '1'
        get_move(@player1)
        computer_move
      else
        get_move(@player1, true)
        get_move(@player2, true)
      end
      if !round_over?
        puts
        puts "You both played #{@emojify[@player1.move]}! You'll have to play this round again"
        puts
        reset_moves
      end
    end
    puts "#{@player1.name} played #{@emojify[@player1.move]}, while #{@player2.name} played #{@emojify[@player2.move]}"
    winner.points += 1
    print_score if @points > 1
    reset_moves
  end

  def play_again
    puts "Enter 'y' to play again, 'm' to return to the main menu, and 'q' to quit"
    print "What would you like to do? "
    action = gets.strip
    quit?(action)
    play if action == 'y'
    if action == 'm'
      reset_game
      main_menu
    end
  end

  def reset_game
    @player1 = nil
    @player2 = nil
    @playmode = ''
    @points = 0
  end

  def print_score
    puts
    print "[Current score"
    print "]".rjust(25-"Current score".length)
    puts
    print "[#{@player1.name}:"
    print "#{@player1.points}]".rjust(25-@player1.name.length-1)
    puts
    print "[#{@player2.name}:"
    puts "#{@player2.points}]".rjust(25-@player2.name.length-1)
    puts
  end

  def reset_player_points
    @player1.points = 0
    @player2.points = 0
  end

  def reset_moves
    @player1.move = ''
    @player2.move = ''
  end

  def round_over?
    @player1.move != @player2.move
  end

  def game_over?
    # game ends when one of the players hits @points number of points
    @player1.points == @points || @player2.points == @points
  end

  def create_computer
    Player.new('Computer')
  end

  def create_player(num)
    puts "Please enter your name, player #{num}"
    print "Player #{num} name: "
    player = gets.strip
    puts "Thanks, #{player}!"
    Player.new(player)
  end

  def get_points
    # number of rounds needed to win game
    puts "Choose the number of points required to win"
    puts "(Hint: It can be any odd number from 1 to 21)"
    until @points.between?(1,21) && @points.odd?
      print "Points: "
      points = gets.chomp
      quit?(points) # in case user wants to quit
      @points = points.to_i
      puts "Please enter an odd number!" unless @points.odd?
    end
  end

  def mode_confirmation(mode)
    puts "You have chosen single player mode! May the odds be ever in your favour!" if mode == '1'
    puts "You have chosen to play against a friend. May the best friend win!" if mode == '2'
  end

  def valid_mode?(mode)
    quit?(mode)
    mode == '1' || mode == '2'
  end

  def get_playmode
    puts "Choose a player mode:"
    puts "Enter '1' for single player, '2' for two-player and 'q' to quit."
    print "Play mode: "
    @playmode = gets.chomp
  end

  def welcome
    puts "=" * @gamewidth
    puts "Welcome to 👊   🖐   ✌️  !"
    puts "(That's emoji for rock, paper, scissors)"
    puts "=" * @gamewidth
  end

end
