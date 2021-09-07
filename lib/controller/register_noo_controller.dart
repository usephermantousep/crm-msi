part of 'controllers.dart';

class RegisterNooController extends GetxController {
  // bool isMockLocation = await TrustLocation.isMockLocation;
  TextEditingController? namaOutlet,
      alamatOutlet,
      daerahOutlet,
      kotaOutlet,
      namaPemilikOutlet,
      ktpOutlet,
      nomorPemilikOutlet,
      nomerWakilOutlet;

  String? selectedCluster;

  String? oppo, vivo, realme, samsung, xiaomi, fl;

  CameraPosition? initialCamera;
  double? lat, long;
  Marker? lokasi;
  File? shopSign, etalase, depan, belakang, kanan, kiri;

  List<String> opsiCluster = [
    'CW1',
    'CW2',
    'CW3',
    'CW4',
    'CW5',
    'CW6',
    'CW7',
    'CW8',
    'CW9',
    'CW10',
    'CJ1',
    'CJ2',
    'CJ3',
    'CJ4',
    'CJ5',
    'CJ6',
    'CJ7',
    'CJ8',
    'CJ9',
    'CJ10',
    'JABO',
  ];

  List<String> opsiAngka = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  void onChangeCluster(String value) {
    selectedCluster = value;
    update();
  }

  void onChangeDigit(String val, String nama) {
    switch (nama) {
      case 'oppo':
        oppo = val;
        break;
      case 'vivo':
        vivo = val;
        break;
      case 'realme':
        realme = val;
        break;
      case 'infinix':
        samsung = val;
        break;
      case 'xiaomi':
        xiaomi = val;
        break;
      default:
        fl = val;
    }
    update();
  }

  void getImage(String namaFile) async {
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
    }
    update();
  }

  void getCurrentPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    initialCamera = CameraPosition(
      target: LatLng(lat!, long!),
      zoom: 14,
    );
    lokasi = Marker(
      markerId: MarkerId(
        'lokasi',
      ),
      infoWindow: InfoWindow(title: "lokasi"),
      position: LatLng(lat!, long!),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    update();
  }

  void submit() {
    print(oppo);
    print(vivo);
    print(samsung);
    print(realme);
    print(xiaomi);
    print(fl);
  }

  @override
  void onInit() {
    namaOutlet = TextEditingController();
    alamatOutlet = TextEditingController();
    daerahOutlet = TextEditingController();
    kotaOutlet = TextEditingController();
    namaPemilikOutlet = TextEditingController();
    ktpOutlet = TextEditingController();
    nomorPemilikOutlet = TextEditingController();
    nomerWakilOutlet = TextEditingController();
    getCurrentPosition();
    super.onInit();
  }

  @override
  void onClose() {
    namaOutlet!.dispose();
    alamatOutlet!.dispose();
    daerahOutlet!.dispose();
    kotaOutlet!.dispose();
    namaPemilikOutlet!.dispose();
    ktpOutlet!.dispose();
    nomorPemilikOutlet!.dispose();
    super.onClose();
  }
}
