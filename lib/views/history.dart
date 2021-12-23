import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_kullanimi/models/record.dart';
import 'package:getx_kullanimi/view-models/controller.dart';
import 'package:getx_kullanimi/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final Controller _controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;

    return Obx(() => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("History"),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _controller.addRecord,
            )
          ],
        ),
        body: Center(
          child: records.isEmpty
              ? const Center(
                  child: Text("Please Add Some Records"),
                )
              : ListView(
                  physics: const BouncingScrollPhysics(),
                  children: records
                      .map((record) => RecordListTile(record: record))
                      .toList(),
                ),
        )));
  }
}
