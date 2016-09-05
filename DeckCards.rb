class Card
	attr_accessor :rank, :suit
	
	def initialize(rank, suit)
		@rank = rank
		@suit = suit
	end
	
	def show_card
		puts "#{rank} of #{suit}"	
	end
	
end

####################################################

class Deck
	
	def initialize
		@cards = []
		@ranks = [*(2..10), 'J', 'Q', 'K', 'A']
		@suits = ['♣', '♥', '♠', '♦']
		
		@suits.each do |suit|
			@ranks.each do |rank|
				@cards << Card.new(rank, suit)
			end
		end
		
		@cards.shuffle!
	end
	
	def give(n = 1)
		n.times do
			@cards.shift.show_card
		end
	end		
	
	def total_available
		puts "#{@cards.count} remaining"
	end
end

####################################################

mazo = Deck.new
mazo.total_available
mazo.give(7)
mazo.total_available