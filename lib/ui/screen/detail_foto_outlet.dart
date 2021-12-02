part of 'screen.dart';

class DetailFotoOutlet extends StatelessWidget {
  final OutletModel data;

  DetailFotoOutlet({
    required this.data,
  });
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'Foto Outlet ',
      subtitle: data.namaOutlet,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelFormRegisterHalf(
                        nama: 'Foto KTP/NPWP',
                        width: 150,
                      ),
                      data.potoKtp == null
                          ? Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width * 0.36,
                              margin: EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.black),
                                  image: DecorationImage(
                                      image: AssetImage('assets/sam.png'),
                                      fit: BoxFit.fitWidth)),
                            )
                          : BoxFotoDetailNoo(image: data.potoKtp!),
                    ],
                  ),
                ],
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
