part of 'screen.dart';

class DetailFotoDanMap extends GetView<DetailNooController> {
  final NooModel data;
  final bool isNoo;

  DetailFotoDanMap({
    required this.data,
    this.isNoo = true,
  });
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: isNoo ? "Foto dan Lokasi" : "Foto",
      subtitle: "Detail Outlet",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Column(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(
                          nama: 'Foto Shop Sign',
                          width: 150,
                        ),
                      ),
                      BoxFotoDetailNoo(image: data.potoShopSign!),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(
                          nama: 'Foto Depan',
                          width: 150,
                        ),
                      ),
                      BoxFotoDetailNoo(image: data.potoDepan!),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(
                          nama: 'Foto Kanan',
                          width: 150,
                        ),
                      ),
                      BoxFotoDetailNoo(image: data.potoDepan!),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(
                          nama: 'Foto Kiri',
                          width: 150,
                        ),
                      ),
                      BoxFotoDetailNoo(image: data.potoKiri!),
                    ],
                  ),
                ],
              ),
              isNoo
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabelFormRegisterHalf(
                              nama: 'Foto KTP/NPWP',
                              width: 150,
                            ),
                            BoxFotoDetailNoo(image: data.potoKtp!),
                          ],
                        ),
                      ],
                    )
                  : SizedBox(),
              SizedBox(
                height: defaultMargin,
              ),
              isNoo
                  ? Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                      height: 280,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: GoogleMap(
                        initialCameraPosition: controller.initialCamera!,
                        myLocationButtonEnabled: false,
                        zoomControlsEnabled: false,
                        markers: {controller.lokasi!},
                      ),
                    )
                  : SizedBox(),
            ],
          ),
          SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }
}
