part of 'screen.dart';

class DetailNoo extends GetView<ListNooController> {
  final NooModel data;
  final String title;

  DetailNoo(this.data, this.title);

  static String getDate(DateTime now) {
    return new DateFormat("d MMMM yyyy").format(now);
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: title,
      subtitle: "Detail Outlet",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        padding:
            EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, defaultMargin),
        child: Column(
          children: [
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nama Outlet"),
                LabelFormRegisterHalf(nama: data.namaOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nama Pemilik"),
                LabelFormRegisterHalf(nama: data.namaPemilikOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Alamat Outlet"),
                LabelFormRegisterHalf(nama: data.alamatOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "KTP/NPWP Pemilik"),
                LabelFormRegisterHalf(nama: data.ktpOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nomer Pemilik"),
                LabelFormRegisterHalf(nama: data.nomerTlpOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nomer Perwakilan"),
                LabelFormRegisterHalf(nama: data.nomerWakilOutlet),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Kota"),
                LabelFormRegisterHalf(nama: data.kota),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Region"),
                LabelFormRegisterHalf(nama: data.region),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Cluster"),
                LabelFormRegisterHalf(nama: data.cluster!.namaCluster),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Limit"),
                LabelFormRegisterHalf(
                    nama: (title == "STATUS : APPROVED" ||
                            title == "STATUS : CONFIRMED")
                        ? NumberFormat.currency(
                                locale: 'id-ID',
                                symbol: 'Rp ',
                                decimalDigits: 0)
                            .format(data.limit)
                        : '-'),
              ],
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 100,
                      child:
                          Text("OPPO : ${data.oppo}", style: blackFontStyle3)),
                  Container(
                      width: 100,
                      child:
                          Text("VIVO : ${data.vivo}", style: blackFontStyle3)),
                  Container(
                      width: 100,
                      child: Text("SAMSUNG : ${data.samsung}",
                          style: blackFontStyle3)),
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 100,
                      child: Text("REALME : ${data.realme}",
                          style: blackFontStyle3)),
                  Container(
                      width: 100,
                      child: Text("XIAOMI : ${data.xiaomi}",
                          style: blackFontStyle3)),
                  Container(
                      width: 100,
                      child: Text("FL : ${data.fl}", style: blackFontStyle3)),
                ],
              ),
            ),
            Divider(),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: TimelineTile(
                      indicatorStyle: IndicatorStyle(
                          height: 50, width: 20, color: Colors.blue[300]!),
                      afterLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      endChild: Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Created by : ${data.user!.namaLengkap!}",
                              style: blackFontStyle2,
                            ),
                            Row(
                              children: [
                                Text(
                                    '${DateFormat('d MMM yyyy HH:mm').format(data.createdAt!)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isFirst: true,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: TimelineTile(
                      afterLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      beforeLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      indicatorStyle: IndicatorStyle(
                          height: 50, width: 20, color: Colors.yellow[300]!),
                      endChild: Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data.confirmedBy == null)
                                  ? 'Confirmed by : -'
                                  : "Confirmed by :  ${data.confirmedBy}",
                              style: blackFontStyle2,
                            ),
                            Row(
                              children: [
                                Text((data.confirmedAt == null)
                                    ? '-'
                                    : '${DateFormat('d MMM yyyy HH:mm').format(data.confirmedAt!)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: TimelineTile(
                      afterLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      beforeLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      indicatorStyle: IndicatorStyle(
                          height: 50, width: 20, color: Colors.green[300]!),
                      endChild: Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data.approvedBy == null)
                                  ? 'Approved by : -'
                                  : "Approved by :  ${data.approvedBy}",
                              style: blackFontStyle2,
                            ),
                            Row(
                              children: [
                                Text((data.approvedAt == null)
                                    ? '-'
                                    : '${DateFormat('d MMM yyyy HH:mm').format(data.approvedAt!)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 70,
                    child: TimelineTile(
                      afterLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      beforeLineStyle: LineStyle(
                        thickness: 2,
                      ),
                      indicatorStyle: IndicatorStyle(
                          height: 50, width: 20, color: Colors.red[300]!),
                      endChild: Container(
                        padding: EdgeInsets.only(left: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              (data.rejectedBy == null)
                                  ? 'Rejected by : -'
                                  : "Rejected by :  ${data.rejectedBy}",
                              style: blackFontStyle2,
                            ),
                            Row(
                              children: [
                                Text((data.rejectedAt == null)
                                    ? '-'
                                    : '${DateFormat('d MMM yyyy HH:mm').format(data.rejectedAt!)}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      isLast: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.generateLokasi(data.latlong!, data.video!);
                      Get.to(
                        () => DetailFotoDanMap(data: data),
                      );
                    },
                    child: Text(
                      "Foto dan Lokasi",
                      style: blackFontStyle3.copyWith(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all("FF3F0A".toColor()),
                        elevation: MaterialStateProperty.all(0)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.to(() =>
                          VideoPlayerScreen(videoUrl: baseFile + data.video!));
                    },
                    child: Text(
                      "Lihat Video",
                      style: blackFontStyle3.copyWith(color: Colors.white),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all("FF3F0A".toColor()),
                        elevation: MaterialStateProperty.all(0)),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }
}
