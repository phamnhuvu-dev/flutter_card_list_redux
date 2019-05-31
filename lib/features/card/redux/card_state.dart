import 'package:equatable/equatable.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart';
import 'package:meta/meta.dart';

@immutable
class CardState extends Equatable {
  final bool ignoreRebuildList;
  final bool isLoading;
  final Map<int, Card> cards;
  final int currentCardId;

  CardState({
    @required this.ignoreRebuildList,
    @required this.isLoading,
    @required this.cards,
    @required this.currentCardId,
  }) : super([ignoreRebuildList, isLoading, cards, currentCardId]);

  factory CardState.initial() {
    return CardState(
      ignoreRebuildList: false,
      isLoading: false,
      cards: Map(),
      currentCardId: null,
    );
  }

  CardState copyWith({
    bool ignoreRebuildList,
    bool isLoading,
    Map<int, Card> cards,
    int currentCardId,
  }) {
    return CardState(
      ignoreRebuildList: ignoreRebuildList ?? this.ignoreRebuildList,
      isLoading: isLoading ?? this.isLoading,
      cards: cards ?? this.cards,
      currentCardId: currentCardId ?? this.currentCardId,
    );
  }
}
