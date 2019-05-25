import 'package:flutter_card_list_redux/features/card/redux/card_actions.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_state.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart';
import 'package:redux/redux.dart';



final cardReducer = combineReducers<CardState>([
  TypedReducer<CardState, LoadCardsAction>(_loadCard),
  TypedReducer<CardState, ClickItemCardOnListAction>(_clickItemOnCardList),
  TypedReducer<CardState, ClickDetailCardAction>(_clickDetailCard),
]);

CardState _loadCard(CardState state, action) {
  Map<int, Card> cards = Map();
  for (int index = 0; index < 10; index++) {
    final card = Card.initial(index);
    cards[card.id] = card;
  }
  return state.copyWith(ignoreRebuildList: false, cards: Map.unmodifiable(cards));
}

CardState _clickItemOnCardList(CardState state, action) {
  final clickItemCardOnListAction = action as ClickItemCardOnListAction;
  return state.copyWith(ignoreRebuildList: true, currentCardId: clickItemCardOnListAction.id);
}

CardState _clickDetailCard(CardState state, action) {
  final clickDetailCardAction = action as ClickDetailCardAction;
  final currentCard = state.cards[state.currentCardId];
  final newValue = currentCard.value + clickDetailCardAction.increaseValue;
  final newCurrentCard = currentCard.copyWith(value: newValue);
  final tempMap = Map.from(state.cards);

  tempMap[currentCard.id] = newCurrentCard;
  return state.copyWith(
    ignoreRebuildList: true,
    cards: Map.unmodifiable(tempMap),
  );
}