// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:getx_kullanimi/models/record.dart';

class Controller extends GetxController {
  var records = <Record>[
    // Record(dateTime: DateTime.now(), weight: 80, note: "AAA"),
    // Record(dateTime: DateTime.now(), weight: 81, note: "BBB"),
    // Record(dateTime: DateTime.now(), weight: 82, note: "CCC"),
    // Record(dateTime: DateTime.now(), weight: 83, note: "DDD"),
  ].obs;

  void addRecord() {
    records.add(Record(dateTime: DateTime.now(), weight: 80, note: "XXXXX"));
    print(records.length);
  }

  void deleteRecord(Record deletedRecord) {
    records.remove(deletedRecord);
  }
}
