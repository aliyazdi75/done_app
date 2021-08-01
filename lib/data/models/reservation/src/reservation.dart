import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:done_app/data/models/reservation/src/serializers.dart';

part 'reservation.g.dart';

abstract class Reservation implements Built<Reservation, ReservationBuilder> {
  String get name;

  Budget get budget;

  Reservation._();

  factory Reservation([void Function(ReservationBuilder) updates]) =
      _$Reservation;

  static Serializer<Reservation> get serializer => _$reservationSerializer;
}

abstract class Budgets implements Built<Budgets, BudgetsBuilder> {
  BuiltList<Budget> get budgets;

  Budgets._();
  factory Budgets([void Function(BudgetsBuilder) updates]) = _$Budgets;

  static Budgets fromJson(String jsonString) {
    return serializers.fromJson(Budgets.serializer, jsonString)!;
  }

  static Serializer<Budgets> get serializer => _$budgetsSerializer;
}

abstract class Budget implements Built<Budget, BudgetBuilder> {
  int? get minimum;

  int? get maximum;

  Budget._();

  factory Budget([void Function(BudgetBuilder) updates]) = _$Budget;

  static Serializer<Budget> get serializer => _$budgetSerializer;
}
