import 'dart:math' as math;
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Card extends Equatable {
  final int id;
  final int value;
  final Color color;

  Card({@required this.id, @required this.value, @required this.color})
      : super([id, value, color]);

  factory Card.initial(int id) {
    return Card(
      id: id,
      value: 0,
      color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0),
    );
  }

  Card copyWith({int id, int value, Color color}) {
    return Card(
      id: id ?? this.id,
      value: value ?? this.value,
      color: color ?? this.color,
    );
  }
}
