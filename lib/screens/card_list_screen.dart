import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/components/card_list.dart';
import 'package:flutter_card_list_redux/features/card/components/detail_card.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_actions.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CardListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CardList(),
            DetailCard(),
            RaisedButton(
              child: Text("Load More Card"),
              onPressed: () {
                store.dispatch(LoadCardsAction());
              },
            ),
          ],
        ),
      ),
    );
  }
}
