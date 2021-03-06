part of 'screen.dart';

class LeadListScreen extends StatelessWidget {
  final controller = Get.put(LeadListController());
  LeadListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'LEAD',
      subtitle: 'Outlet List',
      onBackButtonPressed: () => Get.back(),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 150,
          alignment: Alignment.center,
          child: RefreshIndicator(
            onRefresh: () => controller.getNoo(),
            child: GetBuilder<LeadListController>(
              id: 'listlead',
              builder: (_) => ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _cardLead(index, context),
                ),
                itemCount: controller.lead.length,
              ),
            ),
          ),
        ),
      ),
    );
  }

  _notif(String judul, String msg) => Get.snackbar('title', 'message',
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      titleText: Text(judul,
          style: blackFontStyle1.copyWith(color: Colors.white),
          textAlign: TextAlign.center),
      messageText: Text(msg,
          style: blackFontStyle2.copyWith(color: Colors.white),
          textAlign: TextAlign.center),
      backgroundColor: Colors.red[900]);

  Widget _cardLead(
    int index,
    BuildContext context,
  ) =>
      Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 0.2, color: greyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        child: Container(
          alignment: Alignment.center,
          height: 125,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        controller.lead[index].namaOutlet!,
                        style: blackFontStyle1.copyWith(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: 10,
                      top: 10,
                    ),
                    child: Text(
                      "${DateFormat('dd MMMM y').format(controller.lead[index].createdAt!)}",
                      style: blackFontStyle1.copyWith(
                          fontSize: 16, color: greyColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/sam.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            controller.lead[index].namaPemilikOutlet!,
                            style: blackFontStyle3,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${controller.lead[index].alamatOutlet!} - ${controller.lead[index].distric!}",
                            style: blackFontStyle3.copyWith(
                              color: greyColor,
                              fontSize: 10,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Region - Cluster :",
                          style: blackFontStyle3.copyWith(
                              fontSize: 10, color: greyColor),
                        ),
                        Text(
                          "${controller.lead[index].region!.name} - ${controller.lead[index].cluster!.name}",
                          style: blackFontStyle3.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Telepon :",
                          style: blackFontStyle3.copyWith(
                              fontSize: 10, color: greyColor),
                        ),
                        Text(
                          controller.lead[index].nomerTlpOutlet!,
                          style: blackFontStyle3.copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  _createButton(
                    "Update",
                    () => _bottomSheet(context, index),
                  ),
                  _createButton(
                    "Foto",
                    () => Get.to(() => DetailFotoDanMap(
                          data: controller.lead[index],
                          isNoo: false,
                        )),
                  ),
                  _createButton(
                    "Video",
                    () => Get.to(
                      () => VideoPlayerScreen(
                          videoUrl: baseFile + controller.lead[index].video!),
                    ),
                  ),
                  _createButton("Lokasi", () async {
                    if (!await launch(
                        "https://www.google.com/maps/search/${controller.lead[index].latlong}"))
                      throw 'Could not launch';
                  }),
                ],
              ),
            ],
          ),
        ),
      );

  Widget _createButton(String title, Function() function) => GestureDetector(
        onTap: function,
        child: Container(
          margin: EdgeInsets.only(right: 10),
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

  Future _opsiMediaFoto(
    String namaFile,
  ) =>
      Get.defaultDialog(
        title: 'Upload Foto',
        titleStyle: blackFontStyle2,
        middleText: 'Pilih media :',
        middleTextStyle: blackFontStyle3,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () =>
                    controller.getImage(namaFile, ImageSource.gallery),
                child: Text(
                  "Galeri",
                  style: blackFontStyle3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () =>
                    controller.getImage(namaFile, ImageSource.camera),
                child: Text(
                  "Kamera",
                  style: blackFontStyle3.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      );

  Future _bottomSheet(BuildContext context, int index) => Get.bottomSheet(
        Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Update ${controller.lead[index].namaOutlet!.toLowerCase()}",
                  style: blackFontStyle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Divider(),
              LabelFormRegister(nama: 'Nomer KTP/NPWP Outlet*'),
              Form(
                key: controller.submitFormKey,
                child: FormRegisterNoo(
                  nama: "KTP/NPWP Outlet",
                  controller: controller.ktp,
                  validator: controller.validater,
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => _opsiMediaFoto("ktp"),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: "FF3F0A".toColor(),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text("Upload KTP/NPWP",
                            style: blackFontStyle3.copyWith(
                                fontSize: 12, color: Colors.white)),
                      ),
                    ),
                    Spacer(),
                    GetBuilder<LeadListController>(
                      id: 'fotoktp',
                      builder: (_) => Container(
                        height: 100,
                        width: 90,
                        decoration: controller.ktpFoto == null
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                  image: FileImage(controller.ktpFoto!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async => await controller
                    .submit(controller.lead[index].id!, controller.ktp.text,
                        controller.ktpFoto)
                    .then((value) {
                  if (value.value!) {
                    dialogSubmit("lead");
                  } else {
                    _notif("Salah", value.message!);
                  }
                }),
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: "FF3F0A".toColor(),
                  ),
                  child: Text(
                    "update",
                    style: blackFontStyle3.copyWith(
                        fontSize: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        isScrollControlled: true,
      );

  void dialogSubmit(String jenis) => Get.defaultDialog(
          actions: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  "FF3F0A".toColor(),
                ),
                elevation: MaterialStateProperty.all(0),
              ),
              onPressed: () {
                Get.offAll(() => MainPage(), arguments: 0);
              },
              child: Text(
                "OK",
                style: blackFontStyle3.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
          title: 'Berhasil',
          middleText: 'Data $jenis sudah di update',
          titleStyle: blackFontStyle3.copyWith(fontSize: 14),
          middleTextStyle: blackFontStyle2);
}
