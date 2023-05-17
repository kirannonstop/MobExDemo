import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../mobx/store/timer_store/timer_store.dart';
/*
class StopWatchTimerPage extends StatefulWidget {
  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}*/

class StopWatchTimerPage extends StatelessWidget {
  /*static const countdownDuration = Duration(minutes: 10);
  Duration duration = Duration();
  Timer? timer;

  bool countDown = true;*/

  TimerStore timerStore = TimerStore();

  StopWatchTimerPage() {
    timerStore.reset();
  }

/*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timerStore.reset();
  }*/

/*
  void reset() {
    if (countDown) {
      setState(() => duration = countdownDuration);
    } else {
      setState(() => duration = Duration());
    }
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) => addTime());
  }

  void addTime() {
    final addSeconds = countDown ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void stopTimer({bool resets = true}) {
    if (resets) {
      reset();
    }
    setState(() => timer?.cancel());
  }
*/
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (_) {
            return buildTime();
          }),
          //buildTime(),
          SizedBox(
            height: 80,
          ),
          //buildButtons()
          Observer(builder: (_) {
            return buildButtons();
          }),
        ],
      );

  Widget buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(timerStore.duration.inHours);
    final minutes = twoDigits(timerStore.duration.inMinutes.remainder(60));
    final seconds = twoDigits(timerStore.duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'HOURS'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: minutes, header: 'MINUTES'),
      SizedBox(
        width: 8,
      ),
      buildTimeCard(time: seconds, header: 'SECONDS'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Text(
              time,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 50),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Text(header, style: TextStyle(color: Colors.black45)),
        ],
      );

  Widget buildButtons() {
    final isRunning =
        timerStore.timer == null ? false : timerStore.timer!.isActive;

    final isCompleted = timerStore.duration.inSeconds == 0;

    return isRunning || isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                  text: 'STOP',
                  onClicked: () {
                    if (isRunning) {
                      timerStore.stopTimer(resets: false);
                    }
                  }),
              SizedBox(
                width: 12,
              ),
              ButtonWidget(text: "CANCEL", onClicked: timerStore.stopTimer),
            ],
          )
        : ButtonWidget(
            text: "Start Timer!",
            color: Colors.black,
            backgroundColor: Colors.white,
            onClicked: () {
              timerStore.startTimer();
            });
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Color backgroundColor;
  final VoidCallback onClicked;

  const ButtonWidget(
      {Key? key,
      required this.text,
      required this.onClicked,
      this.color = Colors.white,
      this.backgroundColor = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(fontSize: 20, color: color),
      ));
}
