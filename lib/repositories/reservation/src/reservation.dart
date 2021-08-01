import 'dart:async';

import 'package:done_app/data/models/reservation/index.dart';
import 'package:done_app/providers/api/reservation/index.dart';

class ReservationRepository {
  late Budgets _budgets;

  Future<Budgets> getBudgets() async {
    _budgets = await ReservationApi.getBudgets();
    return _budgets;
  }
}
