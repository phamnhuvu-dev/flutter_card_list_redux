import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/features/card/components/card_list.dart';
import 'package:flutter_card_list_redux/features/card/components/detail_card.dart';

class CardListScreen extends StatefulWidget {
  @override
  State<CardListScreen> createState() => _CardListScreen();
}

class _CardListScreen extends State<CardListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            CardList(),
            DetailCard(),
          ],
        ),
      ),
    );
  }
}
