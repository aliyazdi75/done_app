import 'package:intl/intl.dart';

String priceCovert(int price) {
  final formatCurrency = NumberFormat.currency(symbol: '', decimalDigits: 0);
  return formatCurrency.format(price).replaceAll(',', ' ');
}
