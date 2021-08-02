import 'dart:async';

import 'package:done_app/data/models/reservation/index.dart';
import 'package:done_app/data/providers/api/reservation/index.dart';

class ReservationRepository {
  late Budgets _budgets;

  Future<Budgets> getBudgets() async {
    _budgets = await ReservationApi.getBudgets();
    return _budgets;
  }

  Future<void> submitReservation() async {
    await ReservationApi.submitReservation();
  }
}
