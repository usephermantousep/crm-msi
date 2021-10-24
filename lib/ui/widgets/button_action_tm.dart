part of 'widgets.dart';

class ButtonActionTm extends StatelessWidget {
  const ButtonActionTm({
    Key? key,
    required this.controller,
    required this.idNoo,
  }) : super(key: key);

  final DetailNooController controller;
  final int idNoo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.green[400],
            ),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.all(defaultMargin),
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Apakah anda setuju ?", style: blackFontStyle1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[400]),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () async {
                              await controller
                                  .approve(
                                    idNoo.toString(),
                                  )
                                  .then((value) => value
                                      ? Get.offAll(() => MainPage())
                                      : controller.notif(
                                          "Gagal", "Gagal update status NOO"));
                            },
                            child: Text(
                              "OK",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[400]),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "KEMBALI",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text(
            "Confirm",
            style: blackFontStyle3.copyWith(color: Colors.white),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red[400]),
              elevation: MaterialStateProperty.all(0)),
          onPressed: () {
            Get.bottomSheet(
              Container(
                padding: EdgeInsets.all(defaultMargin),
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelFormRegisterHalf(
                        nama: 'Masukkan alasan :',
                        width: 130,
                      ),
                      DropDownHalf(
                        dropdownValue: controller.alasan,
                        opsi: controller.listAlasan,
                        function: (String? value) {
                          if (value != null) {
                            controller.alasan = value;
                            controller.updateManual('alasan');
                          }
                        },
                        width: 0.7,
                        validator: (String? valid) {
                          if (valid == null) {
                            return 'harus pilih';
                          } else {
                            return null;
                          }
                        },
                      ),
                      GetBuilder<DetailNooController>(
                        id: 'alasan',
                        builder: (_) => (controller.alasan == 'lainya')
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  LabelFormRegisterHalf(
                                    nama: 'Detail alasan :',
                                    width: 130,
                                  ),
                                  Container(
                                    width: 150,
                                    child: TextFormField(
                                      onChanged: (String? string) {
                                        if (string != null) {
                                          controller.detailAlasan = string;
                                        }
                                      },
                                      controller: controller.alasanText,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        hintText: "Jelaskan alasan",
                                        hintStyle: blackFontStyle3.copyWith(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : SizedBox(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[400]),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () {
                              controller
                                  .reject(
                                      idNoo.toString(),
                                      (controller.alasan == 'lainya')
                                          ? controller.alasanText!.text
                                          : controller.alasan!)
                                  .then((value) => value
                                      ? Get.offAll(() => MainPage())
                                      : print('error'));
                            },
                            child: Text(
                              "OK",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red[400]),
                                elevation: MaterialStateProperty.all(0)),
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "KEMBALI",
                              style:
                                  blackFontStyle3.copyWith(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: Text(
            'Reject',
            style: blackFontStyle3.copyWith(color: Colors.white),
          ),
        ),
      ]),
    );
  }
}
