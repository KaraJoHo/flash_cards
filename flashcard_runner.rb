
require './lib/turn'
require './lib/card'
require './lib/deck'
require './lib/round'

class Game

  attr_reader :card_1, :card_2, :card_3, :cards, :deck, :round, :turn, :guess, :new_turn

  def initialize
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @cards = [@card_1, @card_2, @card_3]
    @deck = Deck.new(@cards)
    @round = Round.new(@deck)
    @new_turn = Turn.new(@guess, round.current_card)
  end
 #round = Round.new(Deck.new(cards))

 def start
   puts "Welcome! You are playing with #{deck.count} cards."
   puts "--------------------------------------------------------------"

   puts "This is card number #{round.current_card} out of #{round.deck.count}"

   while (round.turns.length < 3)

     puts "#{round.current_card.question}"

     round.take_turn(@guess = gets.chomp)

     puts round.turns.last.feedback
   end

 end

end
new_game = Game.new
new_game.start

#end
