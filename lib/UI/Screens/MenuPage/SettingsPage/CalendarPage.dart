import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarController _calendarController;
  TimeOfDay _time;
  String _date;
  String _month;
  String _day;
  @override
  void initState() {
    _calendarController = new CalendarController();
    _time = TimeOfDay.now();
    _date = DateTime.now().toIso8601String();
    _month = _date.substring(5, 6) == '0' ? _date.substring(6, 7) : _date.substring(5, 7);
    _day = _date.substring(8, 9) == '0' ? _date.substring(9, 10) : _date.substring(8, 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "교회 일정"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              calendarStyle: CalendarStyle(
                todayColor: Colors.orange,
                selectedColor: Theme.of(context).primaryColor,
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
              ),
              onDaySelected: (date, events) {
                print(date.toIso8601String());
                setState(() {
                  _date = date.toIso8601String();
                  _month = _date.substring(5, 6) == '0' ? _date.substring(6, 7) : _date.substring(5, 7);
                  _day = _date.substring(8, 9) == '0' ? _date.substring(9, 10) : _date.substring(8, 10);
                });
              },
              
              calendarController: _calendarController,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("${_month}월 ${_day}일 일정", style: TextStyle(fontSize: 26),),
            )
          ],
        ),
      ),
    );
  }

  Future<Null> _selectTimeToAdd(BuildContext context) async {
    await _selectTime(context);
  }
  Future<Null> _selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if(picked != null && picked != _time) {
      print('Time selected: ${_time.toString()}');
      setState((){
        _time = picked;
      });
    }
  }
}