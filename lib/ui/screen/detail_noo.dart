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
        child: Column(
          children: [
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nama Outlet"),
                LabelFormRegisterHalf(nama: data.namaOutlet!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nama Pemilik"),
                LabelFormRegisterHalf(nama: data.namaPemilik!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Alamat Outlet"),
                LabelFormRegisterHalf(nama: data.alamatOutlet!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Nomer Pemilik"),
                LabelFormRegisterHalf(nama: data.nomerPemilik!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "KTP/NPWP Pemilik"),
                LabelFormRegisterHalf(nama: data.ktpNpwp!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Kota"),
                LabelFormRegisterHalf(nama: data.kota!),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Tanggal Dibuat"),
                LabelFormRegisterHalf(
                  nama: getDate(data.createdAt!),
                ),
              ],
            ),
            Divider(),
            Row(
              children: [
                LabelFormRegisterHalf(nama: "Dibuat Oleh"),
                LabelFormRegisterHalf(nama: 'Usep Hermanto'),
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
            SizedBox(
              height: defaultMargin,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.generateLokasi(data.latlong!, data.videoUrl!);
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
                      Get.to(() => VideoPlayerScreen(videoUrl: data.videoUrl!));
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
