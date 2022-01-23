import 'package:intl/intl.dart';

getUTC(var unix) {
  var date = DateTime.fromMicrosecondsSinceEpoch(unix);
  return date;
}
