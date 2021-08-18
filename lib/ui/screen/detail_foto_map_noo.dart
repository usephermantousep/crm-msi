part of 'screen.dart';

class DetailFotoDanMap extends GetView<ListNooController> {
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
                      LabelFormRegisterHalf(nama: 'Foto Shop Sign'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotoShopSign!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelFormRegisterHalf(nama: 'Foto Etalase'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotoEtalase!),
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
                      LabelFormRegisterHalf(nama: 'Foto Depan'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotoDepan!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelFormRegisterHalf(nama: 'Foto Belakang'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotoBelakang!),
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
                      LabelFormRegisterHalf(nama: 'Foto Kanan'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotokanan!),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelFormRegisterHalf(nama: 'Foto Kiri'),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.37,
                        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                image: NetworkImage(data.fotoKiri!),
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
