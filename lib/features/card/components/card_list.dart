import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_actions.dart';
import 'package:flutter_card_list_redux/features/card/redux/card_selectors.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart'
    as model;
import 'package:flutter_card_list_redux/features/card/components/card_item.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Store<AppState> store = StoreProvider.of(context);

    final size = MediaQuery.of(context).size;
    final padding = 16.0;
    final widthItem = size.width / 4;
    final heightItem = 1.6 * widthItem + padding;

    return StoreConnector<AppState, Map<int, model.Card>>(
      ignoreChange: (state) => state.cardState.ignoreRebuildList || !ModalRoute.of(context).isCurrent,
      distinct: true,
      converter: (store) => cardListSelector(store.state),
      builder: (BuildContext context, cards) {
        print("Build Card List");
        if (cards == null) {
          store.dispatch(LoadCardsAction());
          return SizedBox(
            height: heightItem,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (cards.isEmpty) {
        } else {
          final list = cards.values.toList();
          return SizedBox(
            height: heightItem + padding,
            child: ListView.separated(
              cacheExtent: 4.0,
              padding: EdgeInsets.all(padding),
              scrollDirection: Axis.horizontal,
              itemCount: cards.length,

              //// ITEM
              itemBuilder: (BuildContext context, int index) {
                final item = list[index];
                return GestureDetector(
                  onTap: () {
                    store.dispatch(ClickItemCardOnListAction(item.id));
                  },
                  child: StoreConnector<AppState, model.Card>(
                    distinct: true,
                    converter: (store) =>
                        cardItemOnListSelector(store.state, item),
                    builder: (BuildContext context, model.Card card) {
                      print("Build Item Card: ${card?.id}-${card?.value}");
                      return CardItem(
                        width: widthItem,
                        height: heightItem,
                        card: card,
                      );
                    },
                  ),
                );
              },

              //// SEPARATOR
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 10.0,
                );
              },
            ),
          );
        }
      },
    );
  }
}
