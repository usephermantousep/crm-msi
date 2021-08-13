part of 'screen.dart';

class GmapsScreen extends StatefulWidget {
  final double? latOutlet, longOutlet;
  final String? title;
  final String? latLong;
  final List<OutletModel>? outlet;
  const GmapsScreen(
      {@required this.longOutlet,
      @required this.outlet,
      @required this.latOutlet,
      @required this.title,
      @required this.latLong});

  @override
  _GmapsScreenState createState() => _GmapsScreenState();
}

class _GmapsScreenState extends State<GmapsScreen> {
  CameraPosition? _initialCamera;
  GoogleMapController? _googleMapController;
  Marker? lokasi;
  Set<Circle>? circles;
  TextEditingController report = TextEditingController();
  File? _image;
  bool isProcess = false;
  double? lat, long, radius;
  Object? selectedOutlet;

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    setState(
      () {
        _initialCamera = CameraPosition(
          target: LatLng(widget.latOutlet!, widget.longOutlet!),
          zoom: 15,
        );
        circles = Set.from([
          Circle(
              circleId: CircleId("radius"),
              center: LatLng(widget.latOutlet!, widget.longOutlet!),
              radius: 50,
              strokeWidth: 2,
              fillColor: Colors.red.withOpacity(0.5))
        ]);
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

  void getImage() async {
    final _picker = ImagePicker();
    if (_image != null) {
      setState(() {
        _image!.delete();
      });
    }

    setState(() {
      isProcess = !isProcess;
    });

    String _time = DateFormat('kk:mm').format(DateTime.now());

    XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.front);

    if (pickedFile != null) {
      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;
      final title = "usep_$_time";
      final bytes = await pickedFile.readAsBytes();
      Img.Image? image = Img.decodeImage(bytes);
      Img.Image? resizeImg = Img.copyResize(image!, width: 720, height: 1280);
      var pureImg = new File("$path/$title.jpg")
        ..writeAsBytesSync(Img.encodeJpg(resizeImg));
      setState(() {
        _image = pureImg;
        isProcess = !isProcess;
      });
    } else {
      setState(() {
        isProcess = !isProcess;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentPosition();
  }

  @override
  void dispose() {
    super.dispose();
    _googleMapController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "Live Visit",
      subtitle: widget.title,
      backColor: Colors.black,
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height - 150,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: 280,
                  padding: EdgeInsets.only(left: 2),
                  child: (_initialCamera == null || circles == null)
                      ? Container(
                          child: Center(
                          child: CircularProgressIndicator(),
                        ))
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: GoogleMap(
                              initialCameraPosition: _initialCamera!,
                              myLocationButtonEnabled: false,
                              zoomControlsEnabled: false,
                              onMapCreated: (controller) =>
                                  _googleMapController = controller,
                              markers: {lokasi!},
                              circles: circles!),
                        ),
                ),
                Container(
                  height: 280,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: (_image == null)
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Center(
                            child: (isProcess)
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                "FF3F0A".toColor()),
                                        elevation:
                                            MaterialStateProperty.all(0)),
                                    onPressed: getImage,
                                    child: Text("Photo"),
                                  ),
                          ),
                        )
                      : Container(
                          width: double.infinity,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: (widget.title == "Check In")
                  ? Container()
                  : RoundedInputField(
                      controller: report,
                      hintText: "Laporan hasil kunjungan",
                      icon: Icons.note_rounded),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 20),
                  child: (widget.title == "Check In")
                      ? Text(
                          "*Pastikan untuk upload foto sebelum ${widget.title}",
                          style: blackFontStyle3.copyWith(fontSize: 10),
                        )
                      : Text(
                          "*Pastikan untuk upload foto dan input laporan sebelum ${widget.title}",
                          style: blackFontStyle3.copyWith(fontSize: 10),
                        ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all("FF3F0A".toColor()),
                    elevation: MaterialStateProperty.all(0)),
                onPressed: () {
                  OutletModel selectedOutlet = widget.outlet!
                      .singleWhere((i) => i.latLong == widget.latLong!);
                  print(selectedOutlet.namaOutlet);
                  print(DateTime.now());
                },
                child: Text(
                  widget.title!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
