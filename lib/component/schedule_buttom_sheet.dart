import 'package:flutter/material.dart';
import 'package:week10/const/colors.dart';
import 'package:week10/component/custom_text_field.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({Key? key}) : super(key: key);

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height / 2+bottomInset,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: bottomInset),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    label: '시작시간',
                    isTime: true,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: CustomTextField(
                    label: '종료시간',
                    isTime: true,
                  ),
                ),
              ],
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: CustomTextField(
                label: '내용',
                isTime: false,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSavePressed,
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_COLOR,
                ),
                child: Text('저장'),
              ),
            )
          ],
        ),
      ),
    ));
  }

  void onSavePressed() {}
}
