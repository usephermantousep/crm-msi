part of 'screen.dart';

class PlanVisitScreen extends StatelessWidget {
  final controller = (Get.arguments == null)
      ? Get.put(PlanVisitController())
      : Get.put(PlanVisitController(
          divisi: Get.arguments['divisi'], region: Get.arguments['region']));
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Plan Visit',
      subtitle: 'Create Plan',
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
                  margin: EdgeInsets.fromLTRB(defaultMargin, 5, 0, 20),
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
                GetBuilder<PlanVisitController>(
                  id: 'tanggal',
                  builder: (_) => LabelFormRegisterHalf(
                    nama: controller.selectedMonth,
                    width: 150,
                  ),
                )
              ],
            ),
            GetBuilder<PlanVisitController>(
              id: 'button',
              builder: (_) => controller.selectedMonth != '-' &&
                      DateTime.now().isAfter(
                        controller.selectedDateTime!.subtract(
                          Duration(days: 5),
                        ),
                      ) &&
                      DateTime.now().isBefore(controller.selectedDateTime!)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: GetBuilder<PlanVisitController>(
                            id: 'dropdown',
                            builder: (_) => DropdownSearch<String>(
                              emptyBuilder: (context, message) => Center(
                                child: Text("Tidak ada daftar Outlet"),
                              ),
                              showSearchBox: true,
                              searchBoxStyle: blackFontStyle2,
                              hint: "Cari Outlet....",
                              popupItemBuilder: (_, item, __) => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  item,
                                  style: (controller.plans.contains(item))
                                      ? blackFontStyle2.copyWith(
                                          color: Colors.grey[400])
                                      : blackFontStyle2,
                                ),
                              ),
                              items: controller.allOutlet,
                              onChanged: (String? value) async {
                                if (value != null) {
                                  controller.changeOutlet(value);
                                }
                              },
                              selectedItem: controller.selectedOutlet,
                              searchBoxDecoration: InputDecoration(
                                hintText: "Cari Outlet ...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                              ),
                            ),
                          ),
                        ),
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
                        SizedBox(),
                      ],
                    )
                  : SizedBox(),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 135,
                    child: Text(
                      "Nama Outlet",
                      style: blackFontStyle2,
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: 135,
                    child: Text("Tanggal Visit", style: blackFontStyle2),
                  ),
                  GetBuilder<PlanVisitController>(
                      id: 'list',
                      builder: (_) => controller.selectedMonth != '-' &&
                              DateTime.now().isAfter(
                                controller.selectedDateTime!.subtract(
                                  Duration(days: 5),
                                ),
                              ) &&
                              DateTime.now()
                                  .isBefore(controller.selectedDateTime!)
                          ? Container(
                              width: 60,
                              child: Text("Hapus", style: blackFontStyle2),
                            )
                          : SizedBox()),
                ],
              ),
            ),
            Divider(),
            GetBuilder<PlanVisitController>(
              id: 'list',
              builder: (_) => Container(
                height: MediaQuery.of(context).size.height - 300,
                child: ListView.separated(
                  itemBuilder: (_, i) => (controller.plans.length > 0)
                      ? ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                width: 135,
                                child: Text(
                                  controller.plans[i],
                                  style: blackFontStyle3.copyWith(fontSize: 14),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                width: 135,
                                child: Text(
                                  controller.showDate(
                                    controller.plans[i],
                                  ),
                                ),
                              ),
                              controller.selectedMonth != '-' &&
                                      DateTime.now().isAfter(
                                        controller.selectedDateTime!.subtract(
                                          Duration(days: 5),
                                        ),
                                      ) &&
                                      DateTime.now().isBefore(
                                          controller.selectedDateTime!)
                                  ? Container(
                                      width: 60,
                                      child: IconButton(
                                        onPressed: () {
                                          controller.confirmDelete(
                                            controller.plans[i],
                                          );
                                        },
                                        icon: Icon(
                                          MdiIcons.close,
                                          color: Colors.red[400],
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
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
                  itemCount: controller.plans.length,
                  separatorBuilder: (_, index) => Divider(
                    height: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
