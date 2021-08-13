part of 'controllers.dart';

class PlanVisitController extends GetxController {
  DateTime? selectedTime;
  String? selectedOutlet;

  String getDate(DateTime now) {
    return new DateFormat("MMMM, y").format(now);
  }

  String getIntMonth(DateTime now) {
    return new DateFormat("M").format(now);
  }

  void notif(String judul, String pesan) {
    Get.snackbar('title', 'message',
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(pesan, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: "FF3F0A".toColor());
  }
}
