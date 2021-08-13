part of 'screen.dart';

class RegisterNooOpsi extends StatefulWidget {
  const RegisterNooOpsi({Key? key}) : super(key: key);

  @override
  _RegisterNooOpsiState createState() => _RegisterNooOpsiState();
}

class _RegisterNooOpsiState extends State<RegisterNooOpsi> {
  TextEditingController keluhanInputanController = TextEditingController();

  List<String> yesNo = ["YES", "NO"];
  List<String> jumlahFl = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"];
  String? colectKg,
      fotLoc,
      tukerNoOwner,
      tukerNoWakOwner,
      tukerNoFl,
      keluhanInputan,
      oppo,
      xiaomi,
      vivo,
      samsung,
      fl,
      realme;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "NOO",
      subtitle: "Detail Opsi Outlet",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Collect KG"),
                    DropDownHalf(
                      dropdownValue: colectKg,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          colectKg = val;
                        });
                      },
                    ),
                    // Text(""),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Foto & Lokasi"),
                    DropDownHalf(
                      dropdownValue: fotLoc,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          fotLoc = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Tukar No Pemilik"),
                    DropDownHalf(
                      dropdownValue: tukerNoOwner,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          tukerNoOwner = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Tukar No Wakil"),
                    DropDownHalf(
                      dropdownValue: tukerNoWakOwner,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          tukerNoWakOwner = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Tukeran Nomor FL"),
                    DropDownHalf(
                      dropdownValue: tukerNoFl,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          tukerNoFl = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Keluhan & Inputan"),
                    DropDownHalf(
                      dropdownValue: keluhanInputan,
                      opsi: yesNo,
                      function: (val) {
                        setState(() {
                          keluhanInputan = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            (keluhanInputan == "YES")
                ? Column(
                    children: [
                      LabelFormRegister(nama: "Keluhan & Inputan"),
                      FormRegisterFull(
                          nama: "Isi Keluhan & Inputan",
                          controller: keluhanInputanController)
                    ],
                  )
                : SizedBox(),
            SizedBox(
              height: defaultMargin,
            ),
            LabelFormRegister(nama: "DETAIL PROMOTOR & FL"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "OPPO"),
                    DropDownHalf(
                      dropdownValue: oppo,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          oppo = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "VIVO"),
                    DropDownHalf(
                      dropdownValue: vivo,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          vivo = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "REALME"),
                    DropDownHalf(
                      dropdownValue: realme,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          realme = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "XIAOMI"),
                    DropDownHalf(
                      dropdownValue: xiaomi,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          xiaomi = val;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "SAMSUNG"),
                    DropDownHalf(
                      dropdownValue: samsung,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          samsung = val;
                        });
                      },
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabelFormRegisterHalf(nama: "Frontliner"),
                    DropDownHalf(
                      dropdownValue: fl,
                      opsi: jumlahFl,
                      function: (val) {
                        setState(() {
                          fl = val;
                        });
                      },
                    ),
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
                  if (fotLoc == "YES") {
                    Get.to(() => FotoDanMap());
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  (fotLoc == "YES") ? "Continue" : "Submit",
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
