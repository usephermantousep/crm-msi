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
        onRefresh: () => controller.getMonitor(),
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          height: MediaQuery.of(context).size.height - 150,
          child: controller.visitMonitor!.length < 1
              ? Container(
                  height: MediaQuery.of(context).size.height - 124,
                  child: Text(
                    "Belum ada histori visit",
                    style: blackFontStyle1,
                  ),
                  alignment: Alignment.center,
                )
              : GetBuilder<ProfileController>(
                  id: 'monitor',
                  builder: (_) => ListView.builder(
                    itemCount: controller.visitMonitor!.length,
                    itemBuilder: (context, index) =>
                        _cardMonitor(index, context),
                  ),
                ),
        ),
      ),
    );
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        controller.visitMonitor![index].outlet!.namaOutlet!,
                        style: blackFontStyle3.copyWith(fontSize: 12),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: Text(
                        "${controller.visitMonitor![index].outlet!.alamatOutlet} - ${controller.visitMonitor![index].outlet!.distric ?? '-'}",
                        style: blackFontStyle3.copyWith(
                            fontSize: 8, color: greyColor),
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "${DateFormat('HH:mm').format(controller.visitMonitor![index].checkInTime!)} - ${controller.visitMonitor![index].checkOutTime == null ? '' : DateFormat('HH:mm').format(controller.visitMonitor![index].checkOutTime!)}",
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
                    width: MediaQuery.of(context).size.width * 0.7,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.1,
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
}
