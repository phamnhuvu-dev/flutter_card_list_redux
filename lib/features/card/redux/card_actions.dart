import 'package:equatable/equatable.dart';

class ClickDetailCardAction extends Equatable {
  int increaseValue;

  ClickDetailCardAction(this.increaseValue);
}

class ClickItemCardOnListAction extends Equatable {
  int id;

  ClickItemCardOnListAction(this.id);
}

class LoadCardsAction extends Equatable {}
