import 'package:intl/intl.dart';

getUTC(var unix) {
  var date = DateTime.fromMillisecondsSinceEpoch(unix * 1000);
  return DateFormat.yMMMMEEEEd().format(date);
}
