//Date DateFormat===============
import 'package:intl/intl.dart';

String getDate({required String value, required String formate}) {
  DateTime tempDate = DateTime.parse(value);
  return DateFormat(formate).format(tempDate);
}
