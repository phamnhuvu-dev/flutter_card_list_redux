import 'package:equatable/equatable.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState extends Equatable {
  final CardState cardState;

  AppState({
    @required this.cardState,
  }) : super([cardState]);

  factory AppState.initial() {
    return AppState(
      cardState: CardState.initial(),
    );
  }

  AppState copyWith({
    CardState demoState,
  }) {
    return AppState(cardState: demoState ?? this.cardState);
  }
}
