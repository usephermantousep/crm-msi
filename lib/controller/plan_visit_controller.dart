part of 'controllers.dart';

class PlanVisitController extends GetxController {
  String selectedMonth = '-';
  String? selectedOutlet;
  String? bulan;
  String? tahun;
  DateTime selectedDateTime = DateTime.now();
  List<String> plans = [];
  List<String> allOutlet = [];
  List<PlanVisitModel> planVisit = [];

  String? validater(String? value) {
    if (value!.isEmpty) {
      return 'wajib di isi';
    }
    return null;
  }

  void show() {
    Get.bottomSheet(
      SfDateRangePicker(
        selectionMode: DateRangePickerSelectionMode.multiple,
        initialDisplayDate: selectedDateTime,
        maxDate: DateTime(2030, 12, 31),
        minDate: DateTime.now().subtract(Duration(days: 5)),
        backgroundColor: Colors.white,
        cancelText: "CANCEL",
        confirmText: "OK",
        onCancel: () {
          Get.back();
        },
        showActionButtons: true,
        onSubmit: (Object? value) {
          if (value != null) {
            List datas = (value as List).map((e) => e).toList();
            datas.sort();
            for (var data in datas) {
              addPlan(DateFormat("yyyy-MM-dd").format(data));
            }
          }
          Future.delayed(Duration(seconds: 1))
              .then((value) => getPlanByMonth(tahun!, bulan!));
          Get.back();
        },
      ),
    );
  }

  void addPlan(String date) async {
    if (selectedOutlet != null) {
      ApiReturnValue result =
          await PlanVisitServices.addPlanVisit(date, selectedOutlet!);
      if (result.value != null) {
        if (result.value) {
          notif(
            'Berhasil',
            "Menambahkan plan visit",
          );
        } else {
          notif(
            "Salah",
            "ada tanggal sama!\nhanya di tambahkan untuk tanggal yang berbeda",
          );
        }
      } else {
        notif(
          "Error",
          result.message!,
        );
      }
    }
  }

  void changeMonth(DateTime value) {
    selectedDateTime = value;
    print(selectedDateTime);
    selectedMonth = DateFormat("MMMM, y").format(value);
    bulan = DateFormat('MM').format(value);
    tahun = DateFormat('y').format(value);
    if (tahun != null && bulan != null) {
      getPlanByMonth(tahun!, bulan!);
    }
    update(['tanggal', 'list', 'button']);
  }

  void getOutlet() async {
    ApiReturnValue<List<OutletModel>> result = await OutletServices.getOutlet();

    if (result.value != null) {
      allOutlet = result.value!.map((e) => e.namaOutlet!).toList();
      update(['dropdown']);
    }
  }

  void getPlanByMonth(String tahun, String bulan) async {
    ApiReturnValue<List<PlanVisitModel>> plan =
        await PlanVisitServices.getPlanbyMonth(tahun, bulan);

    if (plan.value != null) {
      planVisit = plan.value!;
      plans = plan.value!.map((e) => e.outlet!.namaOutlet!).toSet().toList();
      plans.sort();
      update(['list']);
    }
  }

  void changeOutlet(String val) {
    selectedOutlet = val;
    update(['dropdown']);
  }

  String showDate(String outlet) {
    List<String> tanggal = [];
    for (var plan in planVisit) {
      if (plan.outlet!.namaOutlet == outlet) {
        tanggal.add(DateFormat('d').format(plan.tanggalVisit!));
      }
    }
    return tanggal.join(', ');
  }

  void confirmDelete(String namaOutlet) {
    Get.defaultDialog(
        title: 'Delete :',
        middleText: 'Hapus plan visit outlet\n$namaOutlet ?',
        titleStyle: blackFontStyle1,
        middleTextStyle: blackFontStyle2,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  delete(namaOutlet, tahun!, bulan!);
                  Get.back();
                },
                child: Text("YA"),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("TIDAK"),
              )
            ],
          ),
        ]);
  }

  void delete(String namaOutlet, String tahun, String bulan) async {
    ApiReturnValue<bool> result =
        await PlanVisitServices.deletePlanVisit(namaOutlet, tahun, bulan);

    if (result.value != null) {
      if (result.value!) {
        notif("Berhasil", result.message!);
        Future.delayed(Duration(seconds: 1))
            .then((_) => getPlanByMonth(tahun, bulan));
      } else {
        notif('Salah', result.message!);
      }
    }
  }

  @override
  void onInit() {
    getOutlet();
    super.onInit();
  }

  void notif(String judul, String pesan) {
    Get.snackbar('title', 'message',
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.only(bottom: 10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(pesan, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: "FF3F0A".toColor());
  }
}
