import 'package:flutter/material.dart';
import 'package:week10/component/main_calendar.dart';
import 'package:week10/component/schedule_card.dart';
import 'package:week10/component/today_banner.dart';
import 'package:week10/component/schedule_buttom_sheet.dart';
import 'package:week10/const/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        onPressed: (){
          showModalBottomSheet(
              context: context,
              isDismissible: true,
              isScrollControlled: true,
              builder: (_) => ScheduleBottomSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
      
      body: SafeArea(
        child: Column(
          children: [
            MainCalendar(
              selectedDate: selectedDate,
              onDaySelected: onDaySelected,
            ),
            SizedBox(height: 8.0),
            TodayBanner(
              selectedDate: selectedDate,
              count: 0,
            ),
            SizedBox(height: 8.0),
           ScheduleCard(startTime: 12, endTime: 14, content: '스모프')
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
