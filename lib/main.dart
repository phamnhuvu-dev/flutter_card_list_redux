import 'package:flutter/material.dart';
import 'package:flutter_card_list_redux/screens/card_list_screen.dart';
import 'package:flutter_card_list_redux/features/app_state.dart';
import 'package:flutter_card_list_redux/features/store.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        routes: {
          "/": (context) => CardListScreen(),
        },
        initialRoute: "/",
      ),
    );
  }
}