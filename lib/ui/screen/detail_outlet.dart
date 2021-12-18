part of 'screen.dart';

class DetailOutlet extends GetView<ProfileController> {
  final OutletModel outlet;
  DetailOutlet({Key? key, required this.outlet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Detail Outlet",
      subtitle: outlet.namaOutlet!,
      onBackButtonPressed: () => Get.back(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
                defaultMargin, 0, defaultMargin, defaultMargin),
            child: Column(
              children: [
                Row(
                  children: [
                    LabelFormRegisterHalf(
                      nama: "Nama Outlet",
                      width: 150,
                    ),
                    LabelFormRegisterHalf(
                      nama: outlet.namaOutlet ?? '-',
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
                      nama: outlet.kodeOutlet ?? '-',
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
                      nama: outlet.badanUsaha!.name ?? '-',
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
                      nama: outlet.divisi!.name ?? '-',
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
                      nama: outlet.namaPemilikOutlet ?? '-',
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
                      nama: outlet.alamatOutlet ?? '-',
                      width: 150,
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    LabelFormRegisterHalf(
                      nama: "Telepon Pemilik",
                      width: 150,
                    ),
                    LabelFormRegisterHalf(
                      nama: outlet.nomerTlpOutlet ?? '-',
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
                      nama: outlet.distric ?? '-',
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
                      nama: outlet.region!.name ?? '-',
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
                      nama: outlet.cluster!.name ?? '-',
                      width: 150,
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: (outlet.latlong == null ||
                          outlet.video == null ||
                          outlet.potoShopSign == null)
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceAround,
                  children: (outlet.latlong == null)
                      ? [
                          LabelFormRegisterHalf(
                            nama: "Keterangan",
                            width: 150,
                          ),
                          LabelFormRegisterHalf(
                            nama: 'Belum Update',
                            width: 150,
                          ),
                        ]
                      : [
                          (outlet.potoShopSign == null)
                              ? SizedBox()
                              : ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              "FF3F0A".toColor()),
                                      elevation: MaterialStateProperty.all(0)),
                                  onPressed: () => Get.to(
                                      () => DetailFotoOutlet(data: outlet)),
                                  child: Text(
                                    "Lihat Foto",
                                    style: blackFontStyle3.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    "FF3F0A".toColor()),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () => Get.to(() => VideoPlayerScreen(
                                videoUrl: baseFile + outlet.video!)),
                            child: Text(
                              "Lihat Video",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    "FF3F0A".toColor()),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () async {
                              if (!await launch(
                                  'https://www.google.com/maps/place/${outlet.latlong}'))
                                throw 'cloud open';
                            },
                            child: Text(
                              "Lihat Lokasi",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
