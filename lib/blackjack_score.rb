# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, "King", "Queen", "Jack"]
FACE_CARDS = ["King", "Queen", "Jack"]

hand = [10, 1]

def blackjack_score(hand)

  # scores face cards at a value of 10
  hand.each_with_index do |card, i|
    if FACE_CARDS.include?(card)
      hand[i] = 10
    end
  end

  # changes values of Ace
  hand.each_with_index do |card, i|
    if card == 1 && (21 - hand.sum < 11)
      hand[i] = 11
    end
  end

  # raise an error if the hand does not contain 2-5 cards
  if hand.length > 5 || hand.length < 2
    raise ArgumentError.new("Hand can only include 2-5 cards")
  end

  # raise an error if card value is invalid
  hand.each do |card|
    if (card < 1) || (card > 11)
      raise ArgumentError.new("Card value cannot be less than 1, or exceed 11")
    end
  end

  # scores hand
  score = hand.sum.to_i

  # raise an error if the score is greater than 21
  if score > 21
    raise ArgumentError.new("Score cannot exceed 21.")
  end
  return score
end

puts "#{blackjack_score(hand)}"
