part of 'widgets.dart';

class ButtonActionNooDsm extends StatelessWidget {
  const ButtonActionNooDsm({
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
              backgroundColor: MaterialStateProperty.all(Colors.green[400]),
              elevation: MaterialStateProperty.all(0)),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LabelFormRegisterHalf(nama: 'Apakah anda yakin ?'),
                        ],
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
                                  .confirm(
                                    idNoo.toString(),
                                  )
                                  .then(
                                    (value) => value
                                        ? Get.offAll(() => MainPage())
                                        : print('error'),
                                  );
                            },
                            child: Text(
                              "APPROVE",
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
                              "TIDAK",
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
                height: 200,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          LabelFormRegisterHalf(nama: 'Masukkan alasan :'),
                          Container(
                            width: 150,
                            child: DropDownHalf(
                              dropdownValue: controller.alasan,
                              opsi: controller.listAlasan,
                              function: (String? value) {
                                if (value != null) {
                                  controller.alasan = value;
                                }
                              },
                              width: 0.4,
                              validator: (String? valid) {
                                if (valid == null) {
                                  return 'harus pilih';
                                } else {
                                  return null;
                                }
                              },
                            ),
                          )
                        ],
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
                                  .reject(idNoo.toString(), controller.alasan!)
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
