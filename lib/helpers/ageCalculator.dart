import 'package:intl/intl.dart';

int ageCalculator(String dob) {
  var date = DateFormat("dd/MM/yyyy").parse(dob).millisecondsSinceEpoch;
  var today = DateTime.now().millisecondsSinceEpoch;
  return ((today - date) / 1000 / 60 / 60 / 24 / 365).floor();
}
