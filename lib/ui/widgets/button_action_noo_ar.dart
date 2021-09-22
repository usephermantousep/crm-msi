part of 'widgets.dart';

class ButtonActionNooAR extends StatelessWidget {
  const ButtonActionNooAR({
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
                          LabelFormRegisterHalf(nama: 'Masukkan Limit :'),
                          Container(
                              width: 150,
                              child: TextFormField(
                                onChanged: (String? string) {
                                  if (string != null) {
                                    controller.nominal = string;
                                  }
                                  controller.updateManual('currency');
                                },
                                controller: controller.limit,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Limit yang diberikan",
                                  hintStyle: blackFontStyle3.copyWith(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          GetBuilder<DetailNooController>(
                              id: 'currency',
                              builder: (_) {
                                return Text(
                                  (controller.nominal == '')
                                      ? 'Rp0'
                                      : (controller
                                          .formatNumber(controller.nominal)),
                                  style: blackFontStyle3.copyWith(
                                      color: Colors.grey),
                                );
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.green[400]),
                              elevation: MaterialStateProperty.all(0),
                            ),
                            onPressed: () {
                              controller
                                  .confirm(idNoo.toString(),
                                      limit: controller.limit!.text)
                                  .then(
                                    (value) => value
                                        ? Get.offAll(() => MainPage())
                                        : print('error'),
                                  );
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
                              width: 0.3,
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
