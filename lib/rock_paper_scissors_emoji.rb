require "rock_paper_scissors_emoji/version"
require 'rock_paper_scissors_emoji/players.rb'
require 'rock_paper_scissors_emoji/rps.rb'

# run RockPaperScissorsEmoji::play to play

module RockPaperScissorsEmoji
  def self.play
    RPS.new
  end
  # Your code goes here...
end
