import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/card/repo/models/card.dart'
    as model;
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class CardItem extends StatelessWidget {
  final model.Card card;
  final double height;
  final double width;

  const CardItem({Key key, this.card, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (card == null) {
      return SizedBox.shrink();
    } else {
      final size = MediaQuery.of(context).size;
      final fontSize = size.width / 4;

      return Container(
        height: height,
        width: width,
        color: card.color,
        child: Center(
          child: Text(
            "${card.value}",
            style: TextStyle(fontSize: fontSize/2),
          )
        ),
      );
    }
  }
}
