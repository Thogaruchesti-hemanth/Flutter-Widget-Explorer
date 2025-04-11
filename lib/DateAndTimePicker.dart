import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerScreen extends StatefulWidget {
  const DateTimePickerScreen({super.key});

  @override
  State<DateTimePickerScreen> createState() => _DateTimePickerScreenState();
}

class _DateTimePickerScreenState extends State<DateTimePickerScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<TimeOfDay?> _pickCustomTime(BuildContext context) async {
    int selectedHour = TimeOfDay.now().hour;
    int selectedMinute = TimeOfDay.now().minute;
    int selectedSecond = DateTime.now().second;

    return showDialog<TimeOfDay>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Pick Time (with seconds)"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownButton<int>(
                    value: selectedHour,
                    items:
                        List.generate(24, (index) => index)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e h"),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => selectedHour = val!),
                  ),
                  DropdownButton<int>(
                    value: selectedMinute,
                    items:
                        List.generate(60, (index) => index)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e m"),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => selectedMinute = val!),
                  ),
                  DropdownButton<int>(
                    value: selectedSecond,
                    items:
                        List.generate(60, (index) => index)
                            .map(
                              (e) => DropdownMenuItem(
                                value: e,
                                child: Text("$e s"),
                              ),
                            )
                            .toList(),
                    onChanged: (val) => setState(() => selectedSecond = val!),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  TimeOfDay(hour: selectedHour, minute: selectedMinute),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  String formatDateTime() {
    if (selectedDate == null || selectedTime == null) {
      return 'No date & time selected';
    }
    DateTime fullDateTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    return """
     1. Default Format: ${fullDateTime.toString()}
    2. ISO 8601: ${DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(fullDateTime)}
    3. 12-hour format: ${DateFormat("hh:mm a").format(fullDateTime)}
    4. 24-hour format: ${DateFormat("HH:mm").format(fullDateTime)}
    5. DD/MM/YYYY: ${DateFormat("dd/MM/yyyy").format(fullDateTime)}
    6. MM-DD-YYYY: ${DateFormat("MM-dd-yyyy").format(fullDateTime)}
    7. YYYY/MM/DD: ${DateFormat("yyyy/MM/dd").format(fullDateTime)}
    8. Full DateTime: ${DateFormat("EEEE, MMMM d, yyyy HH:mm:ss").format(fullDateTime)}
    9. Epoch Time: ${fullDateTime.millisecondsSinceEpoch}""";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Date and Time picker ShowCas')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => _pickDate(context),
              child: Text('Pick a Date'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => _pickCustomTime(context),
              child: Text('Pick a Time'),
            ),
            SizedBox(height: 10),
            Text(
              formatDateTime(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
