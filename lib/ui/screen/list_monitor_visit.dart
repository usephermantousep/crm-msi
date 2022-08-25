part of 'screen.dart';

class ListMonitorVisit extends GetView<ProfileController> {
  ListMonitorVisit({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
        title: "Monitoring",
        subtitle: "Live Visit",
        onBackButtonPressed: () => Get.back(),
        child: RefreshIndicator(
          onRefresh: () => controller.getMonitor(date: controller.date),
          child: GetBuilder<ProfileController>(
            id: 'monitor',
            builder: (_) => Container(
              padding: EdgeInsets.only(top: 10, left: 10, right: 10),
              height: MediaQuery.of(context).size.height - 150,
              child: controller.visitMonitor?.length == 0
                  ? Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => _getDateUser(context),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: "FF3F0A".toColor(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Text('Change Date',
                                      style: blackFontStyle1.copyWith(
                                          color: Colors.white)),
                                ),
                              ),
                              Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(controller.date),
                                style: blackFontStyle1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Belum ada histori visit",
                              style: blackFontStyle1,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () => _getDateUser(context),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: "FF3F0A".toColor(),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 10,
                                      ),
                                    ],
                                  ),
                                  child: Text('Change Date',
                                      style: blackFontStyle1.copyWith(
                                          color: Colors.white)),
                                ),
                              ),
                              Text(
                                DateFormat('dd MMMM yyyy')
                                    .format(controller.date),
                                style: blackFontStyle1,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Scrollbar(
                            interactive: true,
                            thickness: 5,
                            radius: Radius.circular(10),
                            child: ListView.builder(
                              itemCount: controller.visitMonitor!.length,
                              itemBuilder: (context, index) =>
                                  _cardMonitor(index, context),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ));
  }

  Card _cardMonitor(int index, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.2, color: greyColor),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 3,
      child: ListTile(
        isThreeLine: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                (controller.role == 1)
                    ? "${controller.visitMonitor![index].user!.namaLengkap!} - ${controller.visitMonitor![index].user!.divisi!.name}"
                    : "${controller.visitMonitor![index].user!.namaLengkap!}",
                style: blackFontStyle2.copyWith(
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                    ),
                    Shadow(color: Colors.black)
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.15,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: controller.visitMonitor![index].checkOutTime == null
                      ? Colors.green[100]
                      : Colors.red[100],
                  borderRadius: BorderRadius.circular(6)),
              child: Text(
                controller.visitMonitor![index].checkOutTime == null
                    ? "On-Site"
                    : "Off-Site",
                style: blackFontStyle3.copyWith(
                    fontSize: 8,
                    color: controller.visitMonitor![index].checkOutTime == null
                        ? Colors.green
                        : Colors.red),
              ),
            )
          ],
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/sam.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          controller.visitMonitor![index].outlet!.namaOutlet!,
                          style: blackFontStyle3.copyWith(fontSize: 12),
                        ),
                      ),
                      Container(
                        child: Text(
                          "${controller.visitMonitor![index].outlet!.alamatOutlet} - ${controller.visitMonitor![index].outlet!.distric ?? '-'}",
                          style: blackFontStyle3.copyWith(
                              fontSize: 8, color: greyColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "${DateFormat('dd-MMM-yyyy').format(controller.visitMonitor![index].checkInTime!)} \n ${DateFormat('HH:mm').format(controller.visitMonitor![index].checkInTime!)} - ${controller.visitMonitor![index].checkOutTime == null ? '' : DateFormat('HH:mm').format(controller.visitMonitor![index].checkOutTime!)}",
                  style: blackFontStyle3.copyWith(fontSize: 10),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Laporan :',
                          style: blackFontStyle3.copyWith(
                              color: greyColor, fontSize: 8),
                        ),
                        Text(
                          controller.visitMonitor![index].laporanVisit == null
                              ? '-'
                              : controller.visitMonitor![index].laporanVisit!,
                          style: blackFontStyle3.copyWith(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createButton(
                              "Foto CI",
                              () => Get.to(() => DetailFoto(
                                    foto:
                                        "http://grosir.mediaselularindonesia.com/storage/${controller.visitMonitor![index].pictureVisitIn}",
                                  )),
                            ),
                            controller.visitMonitor?[index].pictureVisitOut ==
                                    null
                                ? const SizedBox()
                                : _createButton(
                                    "Foto CO",
                                    () => Get.to(() => DetailFoto(
                                          foto:
                                              "http://grosir.mediaselularindonesia.com/storage/${controller.visitMonitor![index].pictureVisitOut}",
                                        )),
                                  ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _createButton("Lokasi CI", () async {
                              if (!await launch(
                                  "https://www.google.com/maps/search/${controller.visitMonitor![index].latlongIn}"))
                                throw 'Could not launch';
                            }),
                            controller.visitMonitor?[index].latlongOut == null
                                ? const SizedBox()
                                : _createButton("Lokasi CO", () async {
                                    if (!await launch(
                                        "https://www.google.com/maps/search/${controller.visitMonitor![index].latlongOut}"))
                                      throw 'Could not launch';
                                  }),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Transaksi',
                          style: blackFontStyle3.copyWith(
                              color: greyColor, fontSize: 8),
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color:
                                  controller.visitMonitor![index].transaksi ==
                                          'YES'
                                      ? Colors.green[100]
                                      : Colors.red[100]),
                          child: Text(
                            controller.visitMonitor![index].transaksi == null
                                ? '-'
                                : controller.visitMonitor![index].transaksi!,
                            style: blackFontStyle3.copyWith(
                                fontSize: 8,
                                color:
                                    controller.visitMonitor![index].transaksi ==
                                            'YES'
                                        ? Colors.green
                                        : Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createButton(String title, Function() function) => GestureDetector(
        onTap: function,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: "FF3F0A".toColor(),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            title,
            style: blackFontStyle3.copyWith(fontSize: 10, color: Colors.white),
          ),
        ),
      );

  _getDateUser(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022, 4, 25),
        lastDate: DateTime(2025, 12, 31),
        builder: (context, child) => Theme(
              data: ThemeData.dark(),
              child: child!,
            ));

    if (_pickerDate != null) {
      controller.changeDate(_pickerDate);
    }
  }
}
