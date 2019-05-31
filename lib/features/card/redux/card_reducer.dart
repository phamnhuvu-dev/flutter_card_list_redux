import 'package:flutter_card_list_redux/features/card/redux/card_actions.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_state.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart';
import 'package:redux/redux.dart';



final cardReducer = combineReducers<CardState>([
  TypedReducer<CardState, LoadCardsAction>(_loadCard),
  TypedReducer<CardState, ClickItemCardOnListAction>(_clickItemOnCardList),
  TypedReducer<CardState, ClickDetailCardAction>(_clickDetailCard),
]);

CardState _loadCard(CardState state, LoadCardsAction action) {
  Map<int, Card> cards = state.cards;
  Map<int, Card> newCards = Map();
  for (int index = cards.length ; index < cards.length + 10; index++) {
    final card = Card.initial(index);
    newCards[card.id] = card;
  }
  cards.addAll(newCards);
  return state.copyWith(ignoreRebuildList: false, cards: cards,);
}

CardState _clickItemOnCardList(CardState state, ClickItemCardOnListAction action) {
  return state.copyWith(ignoreRebuildList: true, currentCardId: action.id);
}

CardState _clickDetailCard(CardState state, ClickDetailCardAction action) {
  final cards = state.cards;
  final currentId = state.currentCardId;

  final currentCard = cards[currentId];
  final newValue = currentCard.value + action.increaseValue;
  final newCurrentCard = currentCard.copyWith(value: newValue);

  cards[currentId] = newCurrentCard;

  return state.copyWith(
    ignoreRebuildList: true,
    cards: cards,
  );
}