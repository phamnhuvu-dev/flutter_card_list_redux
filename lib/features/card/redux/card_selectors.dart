import 'dart:collection';

import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart';

final cardListSelector = (AppState state) => UnmodifiableMapView(state.cardState.cards);

final currentCardSelector = (AppState state) => state.cardState.cards != null
    ? state.cardState.cards[state.cardState.currentCardId]
    : null;

final cardItemOnListSelector =
    (AppState state, Card card) => cardListSelector(state)[card.id];
