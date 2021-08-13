part of 'screen.dart';

class RegisterNoo extends StatefulWidget {
  const RegisterNoo({Key? key}) : super(key: key);

  @override
  _RegisterNooState createState() => _RegisterNooState();
}

class _RegisterNooState extends State<RegisterNoo> {
  TextEditingController namaOutlet = TextEditingController();
  TextEditingController alamatOutlet = TextEditingController();
  TextEditingController daerahOutlet = TextEditingController();
  TextEditingController kotaOutlet = TextEditingController();
  TextEditingController namaPemilikOutlet = TextEditingController();
  TextEditingController ktpOutlet = TextEditingController();
  TextEditingController nomorPemilikOutlet = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "NOO",
      subtitle: "Detail Outlet",
      backColor: Colors.black,
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            LabelFormRegister(
              nama: "Nama Outlet",
            ),
            FormRegisterFull(
              controller: namaOutlet,
              nama: 'Isi Nama Outlet',
            ),
            LabelFormRegister(
              nama: 'Nama Pemilik Outlet',
            ),
            FormRegisterFull(
              nama: "Isi Nama Pemilik Outlet",
              controller: namaPemilikOutlet,
            ),
            LabelFormRegister(
              nama: 'Nomor Pemilik Outlet',
            ),
            FormRegisterFull(
              nama: "Isi Nomor Pemilik Outlet",
              controller: nomorPemilikOutlet,
            ),
            LabelFormRegister(nama: 'KTP/NPWP Outlet'),
            FormRegisterFull(
              nama: "KTP/NPWP Outlet",
              controller: ktpOutlet,
            ),
            LabelFormRegister(nama: 'Alamat Outlet'),
            FormRegisterFull(
                nama: "Isi Alamat Outlet", controller: alamatOutlet),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(
                      nama: 'Daerah/Distric',
                    ),
                    FormRegisterHalf(
                      controller: daerahOutlet,
                      nama: 'Contoh : CJ1',
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Kota"),
                    FormRegisterHalf(controller: kotaOutlet, nama: "Isi Kota"),
                  ],
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RegisterNooOpsi());
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  "Continue",
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: defaultMargin,
            )
          ],
        ),
      ),
    );
  }
}
