part of 'controllers.dart';

class PlanVisitController extends GetxController {
  String selectedMonth = '-';
  String? selectedOutlet;
  String? bulan;
  String? tahun;
  List select = [];
  List<PlanVisitModel> planVisit = [];
  List<OutletModel>? allOutlet = [];

  void show() {
    Get.bottomSheet(
      SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.multiple,
        initialDisplayDate: DateTime.now(),
        maxDate: DateTime(2021, 8, 31),
        minDate: DateTime(2021, 8, 1),
        backgroundColor: Colors.white,
        cancelText: "CANCEL",
        confirmText: "OK",
        onCancel: () {
          select.clear();
          Get.back();
        },
        showActionButtons: true,
        onSubmit: (Object? value) {
          List datas = (value as List).map((e) => e).toList();
          datas.sort();
          for (var data in datas) {
            addPlan(DateFormat("yyyy-MM-dd").format(data));
          }
          getPlanByMonth(tahun!, bulan!);

          Get.back();
        },
      ),
    );
    update();
  }

  void addPlan(String date) async {
    if (selectedOutlet != null) {
      ApiReturnValue result =
          await PlanVisitServices.addPlanVisit(date, selectedOutlet!);
      if (result.value != null) {
        if (result.value) {
          notif('Berhasil', "Berhasil menambahkan plan visit");
        }
      } else {
        notif("Salah", "ada tanggal yang sama ");
      }
    }
  }

  void changeMonth(DateTime value) {
    print(value);
    selectedMonth = DateFormat("MMMM, y").format(value);
    bulan = DateFormat('MM').format(value);
    tahun = DateFormat('y').format(value);
    if (tahun != null && bulan != null) {
      getPlanByMonth(tahun!, bulan!);
    }
    update();
  }

  void getOutlet() async {
    ApiReturnValue<List<OutletModel>> result = await OutletServices.getOutlet();

    if (result.value != null) {
      allOutlet = result.value!;
      update();
    }
  }

  void getPlanByMonth(String tahun, String bulan) async {
    ApiReturnValue<List<PlanVisitModel>> plan =
        await PlanVisitServices.getPlanbyMonth(tahun, bulan);

    if (plan.value != null) {
      planVisit = plan.value!;
      update();
    }
    update();
  }

  void changeOutlet(String val) {
    selectedOutlet = val;
    update();
  }

  @override
  void onInit() {
    getOutlet();
    super.onInit();
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
