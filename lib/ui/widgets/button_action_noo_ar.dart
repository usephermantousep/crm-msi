part of 'widgets.dart';

class ButtonActionNooAR extends StatelessWidget {
  const ButtonActionNooAR({
    Key? key,
    required this.controller,
    required this.idNoo,
  }) : super(key: key);

  final ListNooController controller;
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
                            width: 300,
                            child: TextFormField(
                              controller: controller.limit,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "1000000",
                                hintStyle: blackFontStyle3.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "*input tanpa koma atau titik hanya angka",
                            style: blackFontStyle3.copyWith(color: Colors.grey),
                          ),
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
                                  .confirm(idNoo.toString(),
                                      limit: controller.limit.text)
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
                            width: 300,
                            child: TextFormField(
                              controller: controller.alasan,
                              decoration: InputDecoration(
                                hintText: 'Alasan',
                                hintStyle: blackFontStyle3.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
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
                                  .reject(
                                      idNoo.toString(), controller.alasan.text)
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
