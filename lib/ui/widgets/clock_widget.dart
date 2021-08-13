part of 'widgets.dart';

class ClockWidget extends StatelessWidget {
  const ClockWidget({Key? key}) : super(key: key);

  static String getSystemTime() {
    var now = new DateTime.now();
    return new DateFormat("HH:mm:ss").format(now);
  }

  static String getDate() {
    var now = new DateTime.now();
    return new DateFormat("EEE, MMM d yyyy").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      return Column(
        children: [
          Text(
            "${getSystemTime()}",
            style: blackFontStyle1.copyWith(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            "${getDate()}",
            style: blackFontStyle2,
          )
        ],
      );
    });
  }
}
