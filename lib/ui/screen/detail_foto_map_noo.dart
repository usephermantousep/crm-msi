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
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image:
                                    NetworkImage(baseFile + data.potoShopSign!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Etalase'),
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image:
                                    NetworkImage(baseFile + data.potoEtalase!),
                                fit: BoxFit.fill)),
                      )
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
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(baseFile + data.potoDepan!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Belakang'),
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image:
                                    NetworkImage(baseFile + data.potoBelakang!),
                                fit: BoxFit.fill)),
                      )
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
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(baseFile + data.potoKanan!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: defaultMargin),
                        child: LabelFormRegisterHalf(nama: 'Foto Kiri'),
                      ),
                      Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.36,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(baseFile + data.potoKiri!),
                                fit: BoxFit.fill)),
                      )
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
