/*
  To sum up what i've learned at Section 3 Staying on 
  Target with Dart: Implementation of Deck Cards
*/
void main() {
  var deck = new Deck();

  print('Example set of 52 playing cards; 13 of each suit:\n\n $deck');
  print('\nSet of Clubs: ${deck.cardsWithSuit('♣')}');
  print('\nSet of Diamonds: ${deck.cardsWithSuit('♦')}');
  print('\nSet of Hearts: ${deck.cardsWithSuit('♥')}');
  print('\nSet of Spades: ${deck.cardsWithSuit('♠')}');

  deck.shuffle();
  print('\nShuffled Cards:\n\n $deck');
  print('\nSample of Distributing 5 cards per players hand: ${deck.deal(5)}');
}

class Deck {
  List<Card> cards = [];

  // constructor function
  Deck() {
    var ranks = [
      'Ace',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      'Jack',
      'Queen',
      'King'
    ];
    var suits = ['♣', '♦', '♥', '♠'];

    for (var suit in suits) {
      for (var rank in ranks) {
        var card = new Card(rank, suit);
        cards.add(card);
      }
    }
  }

  toString() {
    return cards.toString();
  }

  shuffle() {
    cards.shuffle();
  }

  // displays card based on suit variable given value
  cardsWithSuit(String suit) {
    return cards.where((card) => card.suit == suit);
  }

  // sublist for distributing number of cards
  deal(int handSize) {
    var hand = cards.sublist(0, handSize);
    cards = cards.sublist(handSize);
    return hand;
  }

  // remove a specific card
  remCard(String suit, String rank) {
    cards.removeWhere((card) => card.suit == suit && card.rank == rank);
  }
}

class Card {
  String suit;
  String rank;

  Card(this.rank, this.suit); // constructor function

  toString() {
    // TODO: implement toString
    // Display rank and suits
    return '$rank $suit';
  }
}
