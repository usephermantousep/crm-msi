part of 'screen.dart';

class FotoDanMap extends StatefulWidget {
  const FotoDanMap({Key? key}) : super(key: key);

  @override
  _FotoDanMapState createState() => _FotoDanMapState();
}

class _FotoDanMapState extends State<FotoDanMap> {
  CameraPosition? _initialCamera;
  // ignore: unused_field
  GoogleMapController? _googleMapController;
  double? lat, long;
  Marker? lokasi;
  File? _shopSign, _etalase, _depan, _belakang, _kanan, _kiri;

  Future<File> getImage(var namaFile) async {
    final _picker = ImagePicker();

    XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      String _time = DateFormat('kk:mm').format(DateTime.now());
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;
      final title = "usep_$_time";
      final bytes = await pickedFile.readAsBytes();
      Img.Image? image = Img.decodeImage(bytes);
      Img.Image? resizeImg = Img.copyResize(image!, width: 720, height: 1280);
      var pureImg = new File("$path/$title.jpg")
        ..writeAsBytesSync(Img.encodeJpg(resizeImg));
      setState(() {
        namaFile = pureImg;
      });
    }
    setState(() {});
    return namaFile;
  }

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    setState(
      () {
        _initialCamera = CameraPosition(
          target: LatLng(lat!, long!),
          zoom: 17,
        );
        lokasi = Marker(
          markerId: MarkerId(
            'lokasi',
          ),
          infoWindow: InfoWindow(title: "lokasi"),
          position: LatLng(lat!, long!),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "NOO",
      subtitle: "Foto & Maps",
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
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
                        (_shopSign == null)
                            ? BoxFotoRegistration(
                                function: () async {
                                  getImage(_shopSign);
                                },
                              )
                            : Container(
                                height: 200,
                                width: MediaQuery.of(context).size.width * 0.37,
                                margin: EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black),
                                    image: DecorationImage(
                                        image: FileImage(_shopSign!),
                                        fit: BoxFit.fill)),
                              )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Etalase'),
                        BoxFotoRegistration(
                          function: () async {
                            getImage(_etalase);
                          },
                        ),
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
                        BoxFotoRegistration(
                          function: () async {
                            getImage(_depan);
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Belakang'),
                        BoxFotoRegistration(
                          function: () async {
                            getImage(_belakang);
                          },
                        ),
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
                        BoxFotoRegistration(
                          function: () async {
                            getImage(_kanan);
                          },
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LabelFormRegisterHalf(nama: 'Foto Kiri'),
                        BoxFotoRegistration(
                          function: () async {
                            getImage(_kiri);
                          },
                        ),
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
                  child: (lat == null && long == null)
                      ? Container(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : GoogleMap(
                          initialCameraPosition: _initialCamera!,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          onMapCreated: (controller) =>
                              _googleMapController = controller,
                          markers: {lokasi!},
                        ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 24),
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: ElevatedButton(
                onPressed: () async {
                  bool isMockLocation = await TrustLocation.isMockLocation;
                  print(isMockLocation);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                child: Text(
                  "Submit",
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
