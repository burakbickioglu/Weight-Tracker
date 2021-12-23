import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';

class AddRecordView extends StatefulWidget {
  const AddRecordView({Key? key}) : super(key: key);

  @override
  _AddRecordViewState createState() => _AddRecordViewState();
}

class _AddRecordViewState extends State<AddRecordView> {
  int _selectedValue = 70;
  DateTime _selectedDate = DateTime.now();

  void pickDate(BuildContext context) async {
    var initialDate = DateTime.now();

    // show datepicker and send selected date to temporary variable
    _selectedDate = await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: initialDate.subtract(const Duration(days: 365)),
            lastDate: initialDate.add(const Duration(days: 30)),
            builder: (context, child) {
              return Theme(
                  data: ThemeData.light().copyWith(
                      colorScheme: const ColorScheme(
                          primary: Colors.black87,
                          primaryVariant: Colors.black,
                          secondary: Colors.yellow,
                          secondaryVariant: Colors.yellow,
                          surface: Colors.blue,
                          background: Colors.blueAccent,
                          error: Colors.red,
                          onPrimary: Colors.white,
                          onSecondary: Colors.brown,
                          onSurface: Colors.black26,
                          onBackground: Colors.blueGrey,
                          onError: Colors.orange,
                          brightness: Brightness.light)),
                  child: child ?? const Text(''));
            }) ??
        DateTime.now();
    setState(() {});
    // when datepicker closed, show selected date // call to setstate
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Record"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: DecoratedBox(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      FontAwesomeIcons.weight,
                      size: 40,
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        NumberPicker(
                          itemCount: 3, // ekranda kaç sayı görünecek
                          itemWidth: 80,
                          itemHeight: 50,
                          step: 1,
                          axis: Axis.horizontal,
                          minValue: 40,
                          maxValue: 130,
                          value: _selectedValue,
                          onChanged: (value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                        ),
                        const Icon(
                          FontAwesomeIcons.chevronUp,
                          size: 16,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              pickDate(context);
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: DecoratedBox(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      const Icon(
                        FontAwesomeIcons.calendar,
                        size: 40,
                      ),
                      Expanded(
                          child: Text(
                        DateFormat('EEE, MMM d').format(_selectedDate),
                        textAlign: TextAlign.center,
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: const Text("Note Card"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Save Record"),
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          )
        ],
      ),
    );
  }
}
