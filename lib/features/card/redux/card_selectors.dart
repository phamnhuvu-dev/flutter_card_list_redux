import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart';

final cardListSelector = (AppState state) => state.cardState.cards;

final currentCardSelector = (AppState state) => state.cardState.cards != null
    ? state.cardState.cards[state.cardState.currentCardId]
    : null;

final cardItemOnListSelector =
    (AppState state, Card card) => state.cardState.cards[card.id];
