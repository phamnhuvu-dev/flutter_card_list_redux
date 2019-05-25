import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_actions.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_selectors.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart'
    as model;
import 'package:flutter_card_list_redux/features/card/components/card_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class DetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of(context);
    final size = MediaQuery.of(context).size;
    final widthHeightItem = size.width / 2;

    return GestureDetector(
      onTap: () => store.dispatch(ClickDetailCardAction(1)),
      child: StoreConnector<AppState, model.Card>(
        distinct: true,
        converter: (store) => currentCardSelector(store.state),
        builder: (BuildContext context, model.Card card) {
          print("Build Detail Card: ${card?.id}-${card?.value}");
          return CardItem(
            width: widthHeightItem,
            height: widthHeightItem,
            card: card,
          );
        },
      ),
    );
  }
}
