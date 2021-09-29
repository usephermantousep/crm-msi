part of 'controllers.dart';

class RegisterNooController extends GetxController {
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
  File? shopSign, etalase, depan, belakang, kanan, kiri, video;
  VideoPlayerController? videoPlayerController;

  final submitFormKey = GlobalKey<FormState>();

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
    update(['cluster']);
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
    update(['dropdowndigit']);
  }

  void getImage(String namaFile, ImageSource source) async {
    Get.back();
    Get.defaultDialog(
        title: 'Tunggu ...',
        middleText: 'sedang memproses foto',
        actions: [
          Column(
            children: [
              Center(
                child: CircularProgressIndicator(),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ]);
    final _picker = ImagePicker();

    XFile? pickedFile = await _picker.pickImage(
      source: source,
    );

    if (pickedFile != null) {
      switch (namaFile) {
        case 'fotodepan':
          File convert = await convertImage(namaFile, pickedFile);
          depan = convert;
          update(['fotodepan']);
          break;
        case 'fotobelakang':
          File convert = await convertImage(namaFile, pickedFile);
          belakang = convert;
          update(['fotobelakang']);
          break;
        case 'fotokanan':
          File convert = await convertImage(namaFile, pickedFile);
          kanan = convert;
          update(['fotokanan']);
          break;
        case 'fotokiri':
          File convert = await convertImage(namaFile, pickedFile);
          kiri = convert;
          update(['fotokiri']);
          break;
        case 'fotoetalase':
          File convert = await convertImage(namaFile, pickedFile);
          etalase = convert;
          update(['fotoetalase']);
          break;
        default:
          File convert = await convertImage(namaFile, pickedFile);
          shopSign = convert;
          update(['fotoshopsign']);
      }
      Get.back();
      update(['butfoto']);
    }
    if (pickedFile == null) {
      Get.back();
    }
  }

  Future<File> convertImage(String namaFile, XFile pickedFile) async {
    String _time = DateFormat('MMM-d-yyyy-kk-mm-ss').format(DateTime.now());
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final title = 'noo-' + _time + '-' + namaFile;
    final bytes = await pickedFile.readAsBytes();
    Img.Image? image = Img.decodeImage(bytes);
    Img.Image? resizeImg = Img.copyResize(image!, width: 720, height: 1280);
    var pureImg = new File("$path/$title.jpg")
      ..writeAsBytesSync(Img.encodeJpg(resizeImg));
    return pureImg;
  }

  void opsiMediaFoto(String namaFile) {
    Get.defaultDialog(
      title: 'Upload Foto',
      titleStyle: blackFontStyle2,
      middleText: 'Pilih media :',
      middleTextStyle: blackFontStyle3,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all("FF3F0A".toColor()),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                getImage(namaFile, ImageSource.gallery);
              },
              child: Text(
                "Galeri",
                style: blackFontStyle3.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all("FF3F0A".toColor()),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                getImage(namaFile, ImageSource.camera);
              },
              child: Text(
                "Kamera",
                style: blackFontStyle3.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void opsiMediaVideo() {
    Get.defaultDialog(
        actions: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              getVideo(ImageSource.camera);
            },
            child: Text("Kamera",
                style: blackFontStyle3.copyWith(color: Colors.white)),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              getVideo(ImageSource.gallery);
            },
            child: Text("Galeri",
                style: blackFontStyle3.copyWith(color: Colors.white)),
          )
        ],
        title: 'Upload Video',
        middleText: 'Pilih Media :',
        titleStyle: blackFontStyle3.copyWith(fontSize: 14),
        middleTextStyle: blackFontStyle2);
  }

  void deleteFoto(String namaFile) {
    switch (namaFile) {
      case 'fotodepan':
        depan = null;
        update(['fotodepan']);
        break;
      case 'fotobelakang':
        belakang = null;
        update(['fotobelakang']);
        break;
      case 'fotokanan':
        kanan = null;
        update(['fotokanan']);
        break;
      case 'fotokiri':
        kiri = null;
        update(['fotokiri']);
        break;
      case 'fotoetalase':
        etalase = null;
        update(['fotoetalase']);
        break;
      default:
        shopSign = null;
        update(['fotoshopsign']);
    }
    update(['butfoto']);
  }

  Future<bool> getCurrentPosition() async {
    bool isMockLocation = await TrustLocation.isMockLocation;
    if (isMockLocation) {
      return false;
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    long = position.longitude;
    initialCamera = CameraPosition(
      target: LatLng(lat!, long!),
      zoom: 16,
    );
    lokasi = Marker(
      markerId: MarkerId(
        'lokasi',
      ),
      infoWindow: InfoWindow(title: "lokasi"),
      position: LatLng(lat!, long!),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    update(['gmaps']);
    return true;
  }

  String? validater(String? value) {
    if (value == null) {
      return 'wajib di isi';
    }

    if (value.isEmpty) {
      return 'wajib di isi';
    }
    return null;
  }

  void getVideo(ImageSource source) async {
    Get.back();
    notifLoading("Converting", "Sedang memproses video");
    ImagePicker picker = ImagePicker();

    XFile? pickedVideo = await picker.pickVideo(source: source);

    if (pickedVideo != null) {
      File vid = File(pickedVideo.path);
      await VideoCompress.setLogLevel(0);
     MediaInfo? info = await VideoCompress.compressVideo(
      vid.path,
      quality: VideoQuality.LowQuality,
      deleteOrigin: true,
      includeAudio: true,
    );

    video = info!.file;
    Get.back();
      videoPlayerController = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          videoPlayerController!.play();
          update(['video', 'butvid']);
        });
    }
  }

  void play() => videoPlayerController!.play();

  void pause() => videoPlayerController!.pause();

  void deleteVideo() {
    video = null;
    update(['video']);
  }

  void notif(String judul, String msg) => Get.snackbar('title', 'message',
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(msg, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: Colors.red[900]);
  

  void notifLoading(String title, String subtitle) => Get.defaultDialog(
      title: title,
      middleText: subtitle,
      barrierDismissible: false,
      actions: [
        Column(
          children: [
            Center(
              child: CircularProgressIndicator(),
            ),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ],
    );
  
  void dialogSubmit() => Get.defaultDialog(
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                "FF3F0A".toColor(),
              ),
              elevation: MaterialStateProperty.all(0),
            ),
            onPressed: () {
              Get.offAll(() => MainPage());
            },
            child: Text(
              "OK",
              style: blackFontStyle3.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
        title: 'Berhasil',
        middleText: 'Data noo sudah di tambahkan',
        titleStyle: blackFontStyle3.copyWith(fontSize: 14),
        middleTextStyle: blackFontStyle2);
  
  void submit() async {
    if (submitFormKey.currentState!.validate()) {
      if (video == null ||
          shopSign == null ||
          etalase == null ||
          depan == null ||
          kanan == null ||
          kiri == null ||
          belakang == null) {
        notif("Salah", 'Data belum lengkap silahkan cek kembali');
      } else {
        List<File> images = [];
        images.add(shopSign!);
        images.add(etalase!);
        images.add(depan!);
        images.add(kanan!);
        images.add(kiri!);
        images.add(belakang!);
        notifLoading('Tunggu', 'Sedang mengirim data');
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        String latlong = '${position.latitude},${position.longitude}';
        ApiReturnValue<bool> result = await NooService.submit(
          images,
          video!,
          namaOutlet: namaOutlet!.text,
          alamat: alamatOutlet!.text,
          namaPemilik: namaPemilikOutlet!.text,
          ktpnpwp: ktpOutlet!.text,
          nomerPemilik: nomorPemilikOutlet!.text,
          nomerPerwakilan: nomerWakilOutlet!.text,
          cluster: selectedCluster,
          kota: kotaOutlet!.text,
          oppo: oppo,
          vivo: vivo,
          samsung: samsung,
          realme: realme,
          xiaomi: xiaomi,
          fl: fl,
          latlong: latlong,
        );
        if (result.value != null) {
          Get.back();
          if (result.value!) {
            dialogSubmit();
          } else {
            notif("Gagal", result.message!);
          }
        }
      }
    } else {
      notif("Salah", 'Data belum lengkap silahkan cek kembali');
    }
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
