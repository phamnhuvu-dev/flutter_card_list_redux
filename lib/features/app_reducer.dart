import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    cardState: cardReducer(state.cardState, action),
  );
}
