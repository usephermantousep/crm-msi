part of 'screen.dart';

class DetailFotoDanMap extends GetView<DetailNooController> {
  final NooModel data;

  DetailFotoDanMap({
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Foto dan Lokasi',
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
                        child: LabelFormRegisterHalf(nama: 'Foto Shop Sign'),
                      ),
                      BoxFotoDetailNoo(image: data.potoShopSign!),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Etalase'),
                      ),
                      BoxFotoDetailNoo(image: data.potoEtalase!),

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
                        child: LabelFormRegisterHalf(nama: 'Foto Depan'),
                      ),
                      BoxFotoDetailNoo(image: data.potoDepan!),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Belakang'),
                      ),
                      BoxFotoDetailNoo(image: data.potoBelakang!),

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
                        child: LabelFormRegisterHalf(nama: 'Foto Kanan'),
                      ),
                      BoxFotoDetailNoo(image: data.potoDepan!),

                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Kiri'),
                      ),
                      BoxFotoDetailNoo(image: data.potoKiri!),

                    ],
                  ),
                ],
              ),
              SizedBox(
                height: defaultMargin,
              ),
              Container(
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
              ),
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

