part of 'controllers.dart';

class PlanVisitController extends GetxController {
  String? selectedTime = '';
  List<OutletModel> outlet = [];
  List select = [];

  void show(int index) {
    print(outlet[index].namaOutlet);
    Get.bottomSheet(
      SfDateRangePicker(
          selectionMode: DateRangePickerSelectionMode.multiple,
          initialDisplayDate: DateTime.now(),
          maxDate: DateTime(2021, 8, 31),
          minDate: DateTime(2021, 8, 1),
          backgroundColor: "FF3F0A".toColor(),
          cancelText: "CANCEL",
          confirmText: "OK",
          onCancel: () {
            Get.back();
          },
          showActionButtons: true,
          onSubmit: (Object? value) {
            select.clear();
            select.add(value);
            List convert = select
                .map((e) => DateFormat("EEE, MMM d yyyy").format(e))
                .toList();
            print(convert);
          }),
    );
  }

  void changeMonth(DateTime now) {
    selectedTime = DateFormat("MMMM, y").format(now);
    update();
  }

  void getOutlet() async {
    outlet = [];
    ApiReturnValue<List<OutletModel>> result =
        await OutletServices.getOutlet(1);

    if (result.value != []) {
      outlet = result.value!;
    }
    update();
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

  void resetInit() {
    selectedTime = '';
    outlet = [];
    select = [];
  }
}
