import 'package:flutter/material.dart';
import 'package:getx_kullanimi/widgets/record_list_tile.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("History"),
      ),
      body: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: const [
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
            RecordListTile(),
          ],
        ),
      ),
    );
  }
}
