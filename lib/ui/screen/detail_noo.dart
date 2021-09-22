part of 'screen.dart';

class DetailNoo extends StatelessWidget {
  final controller = Get.put(DetailNooController());
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
            GetBuilder<ListNooController>(
              id: 'timeline',
              builder: (_) => TimelineNoo(data: data),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            (data.keterangan != null) ? Divider() : SizedBox(),
            (data.keterangan != null)
                ? Row(
                    children: [
                      LabelFormRegisterHalf(nama: "Alasan ditolak"),
                      LabelFormRegisterHalf(nama: data.keterangan),
                    ],
                  )
                : SizedBox(),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: 'Foto dan Video :'),
              ],
            ),
            ButtonFotoVideoNoo(controller: controller, data: data),
            SizedBox(
              height: defaultMargin,
            ),
            GetBuilder<DetailNooController>(
              id: 'buttonar',
              builder: (_) => Column(
                children: [
                  (controller.role == 'AR' && title == "STATUS : PENDING")
                      ? Divider()
                      : SizedBox(),
                  (controller.role == 'AR' && title == "STATUS : PENDING")
                      ? Row(
                          children: [LabelFormRegisterHalf(nama: "Action :")],
                        )
                      : SizedBox(),
                  (controller.role == 'AR' && title == "STATUS : PENDING")
                      ? ButtonActionNooAR(
                          controller: controller,
                          idNoo: data.id!,
                        )
                      : Container(),
                ],
              ),
            ),
            GetBuilder<DetailNooController>(
              id: 'buttonar',
              builder: (_) => Column(
                children: [
                  (controller.role == 'DSM' && title == "STATUS : CONFIRMED")
                      ? Divider()
                      : SizedBox(),
                  (controller.role == 'DSM' && title == "STATUS : CONFIRMED")
                      ? Row(
                          children: [LabelFormRegisterHalf(nama: "Action :")],
                        )
                      : SizedBox(),
                  (controller.role == 'DSM' && title == "STATUS : CONFIRMED")
                      ? ButtonActionNooDsm(
                          controller: controller, idNoo: data.id!)
                      : SizedBox(),
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
