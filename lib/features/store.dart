import 'package:flutter_card_list_redux/features/app_reducer.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:redux/redux.dart' show Store;

Store<AppState> get store {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    distinct: true,
    middleware: [],
  );
}
