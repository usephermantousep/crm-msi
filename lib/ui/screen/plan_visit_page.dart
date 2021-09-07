part of 'screen.dart';

class PlanVisitScreen extends StatelessWidget {
  final controller = Get.put(PlanVisitController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanVisitController>(
      builder: (_) => GeneralPage(
        title: 'Plan Visit',
        subtitle: 'Form',
        onBackButtonPressed: () {
          Get.back();
        },
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(defaultMargin, 16, 0, 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all("FF3F0A".toColor()),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        onPressed: () async {
                          showMonthPicker(
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2031),
                            firstDate: DateTime(2021),
                          ).then((value) async {
                            if (value != null) {
                              controller.changeMonth(value);
                            }
                          });
                        },
                        child: Text(
                          "Pilih Bulan",
                          style: blackFontStyle3.copyWith(color: Colors.white),
                        )),
                  ),
                  LabelFormRegisterHalf(
                    nama: controller.selectedMonth,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<PlanVisitController>(
                      builder: (_) => DropDownHalf(
                          dropdownValue: controller.selectedOutlet,
                          opsi: controller.allOutlet!
                              .map((e) => e.namaOutlet!)
                              .toList(),
                          function: (String? val) {
                            if (val != null) {
                              controller.changeOutlet(val);
                            }
                          },
                          width: 0.45)),
                  TextButton(
                    onPressed: () {
                      controller.show();
                    },
                    child: Text(
                      "Pilih\nTanggal",
                      style: blackFontStyle3.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: "FF3F0A".toColor(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: defaultMargin,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nama Outlet",
                      style: blackFontStyle2,
                    ),
                    Text("Tanggal Visit", style: blackFontStyle2)
                  ],
                ),
              ),
              Divider(),
              GetBuilder<PlanVisitController>(
                builder: (_) => Container(
                  height: MediaQuery.of(context).size.height - 340,
                  child: ListView.separated(
                    itemBuilder: (_, i) => (controller.planVisit.length > 0)
                        ? ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 5),
                                  width: 200,
                                  child: Text(
                                    controller.planVisit[i].outlet!.namaOutlet!,
                                    style:
                                        blackFontStyle3.copyWith(fontSize: 14),
                                  ),
                                ),
                                Container(
                                  width: 100,
                                  child: Center(
                                    child: Text(DateFormat('d').format(
                                        controller.planVisit[i].tanggalVisit!)),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListTile(
                            title: Center(
                              child: Text(
                                'Belum ada Data',
                                style: blackFontStyle1,
                              ),
                            ),
                          ),
                    itemCount: controller.planVisit.length,
                    separatorBuilder: (_, index) => Divider(
                      height: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
