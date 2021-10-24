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
                LabelFormRegisterHalf(
                  nama: "Nama Outlet",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.namaOutlet,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Kode Outlet",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.kodeOutlet ?? '-',
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Badan Usaha",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.badanUsaha!.name ?? '-',
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Divisi",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.divisi!.name ?? '-',
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Nama Pemilik",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.namaPemilikOutlet,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Alamat Outlet",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.alamatOutlet,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "KTP/NPWP Pemilik",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.ktpOutlet,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Nomer Pemilik",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.nomerTlpOutlet,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Nomer Perwakilan",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.nomerWakilOutlet ?? '-',
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "distric",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.distric,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Region",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.region!.name,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Cluster",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: data.cluster!.name,
                  width: 150,
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: "Limit",
                  width: 150,
                ),
                LabelFormRegisterHalf(
                  nama: (title == "STATUS : APPROVED" ||
                          title == "STATUS : CONFIRMED")
                      ? NumberFormat.currency(
                              locale: 'id-ID', symbol: 'Rp ', decimalDigits: 0)
                          .format(data.limit)
                      : '-',
                  width: 150,
                ),
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
                      LabelFormRegisterHalf(
                        nama: "Alasan ditolak",
                        width: 150,
                      ),
                      LabelFormRegisterHalf(
                        nama: data.keterangan,
                        width: 150,
                      ),
                    ],
                  )
                : SizedBox(),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(
                  nama: 'Foto dan Video :',
                  width: 150,
                ),
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
                  (controller.role == 4 && title == "STATUS : PENDING")
                      ? Divider()
                      : SizedBox(),
                  (controller.role == 4 && title == "STATUS : PENDING")
                      ? Row(
                          children: [
                            LabelFormRegisterHalf(
                              nama: "Action :",
                              width: 150,
                            )
                          ],
                        )
                      : SizedBox(),
                  (controller.role == 4 && title == "STATUS : PENDING")
                      ? ButtonActionNooAR(
                          controller: controller,
                          idNoo: data.id!,
                        )
                      : Container(),
                ],
              ),
            ),
            GetBuilder<DetailNooController>(
              id: 'buttontm',
              builder: (_) => Column(
                children: [
                  (controller.role == 1 && title == "STATUS : CONFIRMED")
                      ? Divider()
                      : SizedBox(),
                  (controller.role == 1 && title == "STATUS : CONFIRMED")
                      ? Row(
                          children: [
                            LabelFormRegisterHalf(
                              nama: "Action :",
                              width: 150,
                            )
                          ],
                        )
                      : SizedBox(),
                  (controller.role == 1 && title == "STATUS : CONFIRMED")
                      ? ButtonActionTm(
                          controller: controller,
                          idNoo: data.id!,
                        )
                      : Container(),
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
