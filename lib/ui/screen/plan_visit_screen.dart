part of 'screen.dart';

class PlanVisitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanVisitController>(
      builder: (controller) => GeneralPage(
        title: 'Plan Visit',
        subtitle: 'Form',
        onBackButtonPressed: () {
          Get.back();
        },
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        defaultMargin, 16, defaultMargin, 6),
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all("FF3F0A".toColor()),
                          elevation: MaterialStateProperty.all(0),
                        ),
                        onPressed: () async {
                          showMonthPicker(
                            context: context,
                            initialDate: DateTime.now(),
                            lastDate: DateTime(2031),
                            firstDate: DateTime(2021),
                          ).then((value) async {
                            if (value != null) {
                              controller.changeMonth(value);
                              controller.getOutlet();
                            }
                          });
                        },
                        child: Text(
                          "Pilih Bulan",
                          style: blackFontStyle3.copyWith(color: Colors.white),
                        )),
                  ),
                  LabelFormRegisterHalf(
                    nama: controller.selectedTime,
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height - 224,
                child: ListView.separated(
                  itemBuilder: (context, index) => (controller.outlet != [])
                      ? ListTile(
                          title: Row(
                            children: [
                              Container(
                                width: 150,
                                child: Text(
                                  controller.outlet[index].namaOutlet!,
                                  style: blackFontStyle3.copyWith(fontSize: 14),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      "FF3F0A".toColor()),
                                  elevation: MaterialStateProperty.all(0),
                                ),
                                onPressed: () {
                                  controller.show(index);
                                },
                                child: Text("Pilih Tanggal"),
                              )
                            ],
                          ),
                        )
                      : Container(),
                  itemCount: controller.outlet.length,
                  separatorBuilder: (_, index) => Divider(
                    height: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
