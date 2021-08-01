import 'package:done_app/data/models/reservation/index.dart';
import 'package:flutter/services.dart';

class ReservationApi {
  static Future<Budgets> getBudgets() async {
    await Future.delayed(const Duration(seconds: 1));
    final jsonStr = await rootBundle.loadString('assets/data.json');
    return Budgets.fromJson(jsonStr);
  }
}
