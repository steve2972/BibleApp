import 'package:bible_test2/UI/Widgets/CommonAppBar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage>{
  Map<DateTime, List> _events;
  List _selectedEvents;
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

    final _selectedDay = DateTime.now();

    _events = {
      _selectedDay.subtract(Duration(days: 30)): ['Event A0', 'Event B0', 'Event C0'],
      _selectedDay.subtract(Duration(days: 27)): ['Event A1'],
      _selectedDay.subtract(Duration(days: 20)): ['Event A2', 'Event B2', 'Event C2', 'Event D2'],
      _selectedDay.subtract(Duration(days: 16)): ['Event A3', 'Event B3'],
      _selectedDay.subtract(Duration(days: 10)): ['Event A4', 'Event B4', 'Event C4'],
      _selectedDay.subtract(Duration(days: 4)): ['Event A5', 'Event B5', 'Event C5'],
      _selectedDay.subtract(Duration(days: 2)): ['Event A6', 'Event B6'],
      _selectedDay: ['Event A7', 'Event B7', 'Event C7', 'Event D7', 'Event E8', 'Event E9'],
      _selectedDay.add(Duration(days: 1)): ['Event A8', 'Event B8', 'Event C8', 'Event D8'],
      _selectedDay.add(Duration(days: 3)): Set.from(['Event A9', 'Event A9', 'Event B9']).toList(),
      _selectedDay.add(Duration(days: 7)): ['Event A10', 'Event B10', 'Event C10'],
      _selectedDay.add(Duration(days: 11)): ['Event A11', 'Event B11'],
      _selectedDay.add(Duration(days: 17)): ['Event A12', 'Event B12', 'Event C12', 'Event D12'],
      _selectedDay.add(Duration(days: 22)): ['Event A13', 'Event B13'],
      _selectedDay.add(Duration(days: 26)): ['Event A14', 'Event B14', 'Event C14'],
    };

    _selectedEvents = _events[_selectedDay] ?? [];
    _calendarController = CalendarController();

    super.initState();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, "교회 일정"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTableCalender(),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("$_month 월 $_day 일 일정", style: TextStyle(fontSize: 26),),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.sync),
                  onPressed: (){},
                ),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: (){},
                )
              ],
            ),
          ),
          Expanded(child:  _buildEventList()),
        ],
      ),
    );
  }

  Widget _buildTableCalender() {
    return TableCalendar(
      events: _events,
      availableCalendarFormats: const {
        CalendarFormat.month : '월', 
        CalendarFormat.twoWeeks : '2 주', 
        CalendarFormat.week : '주',
      },
      calendarStyle: CalendarStyle(
        markersMaxAmount: 1,
        markersColor: Colors.red,
        todayColor: Colors.grey[50],
        selectedColor: Colors.blue[400],
        todayStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black
        ),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
      ),
      onDaySelected: _onDaySelected,
      calendarController: _calendarController,
    );
  }

  void _onDaySelected(DateTime date, List events) {
    print(date.toIso8601String());
        setState(() {
          _date = date.toIso8601String();
          _month = _date.substring(5, 6) == '0' ? _date.substring(6, 7) : _date.substring(5, 7);
          _day = _date.substring(8, 9) == '0' ? _date.substring(9, 10) : _date.substring(8, 10);
          _selectedEvents = events;
        });
  }

  Widget _buildEventList() {

    return _selectedEvents.isNotEmpty ? ListView(
      children: _selectedEvents
          .map((event) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.8),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: ListTile(
                  title: Text(event.toString()),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    ) : Center(child: Text("일정 없음", style: TextStyle(fontSize: 22),));
  }
}