part of 'controllers.dart';

class UpdateFotoOutletController extends GetxController {
  File? shopSign, depan, kanan, kiri, ktp, video;
  TextEditingController namaPemilikOutlet = TextEditingController();
  TextEditingController nomorPemilikOutlet = TextEditingController();
  final submitFormKey = GlobalKey<FormState>();
  VideoPlayerController? videoPlayerController;
  MediaInfo? compressedVideoInfo;

  Future<File> convertImage(String namaFile, XFile pickedFile) async {
    String _time = DateFormat('MMM-d-yyyy-kk-mm-ss').format(DateTime.now());
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    final title = 'update-' + _time + '-' + namaFile;
    final bytes = await pickedFile.readAsBytes();
    Img.Image? image = Img.decodeImage(bytes);
    Img.Image? resizeImg = Img.copyResize(image!, width: 720, height: 1280);
    var pureImg = new File("$path/$title.jpg")
      ..writeAsBytesSync(Img.encodeJpg(resizeImg));
    return pureImg;
  }

  void getVideo(BuildContext context) async {
    ImagePicker picker = ImagePicker();

    XFile? pickedVideo = await picker.pickVideo(
      source: ImageSource.camera,
      maxDuration: Duration(
        minutes: 1,
      ),
    );

    if (pickedVideo != null) {
      compressvideo(context, pickedVideo);
    }
  }

  void play() => videoPlayerController!.play();

  void pause() => videoPlayerController!.pause();

  void deleteVideo() {
    video = null;
    update(['video', 'butvid']);
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

  Future compressvideo(BuildContext context, XFile pickedVideo) async {
    showDialog(
        context: context,
        builder: (context) => Dialog(child: ProgressDialogWidget()),
        barrierDismissible: false);
    final info = await VideoCompressApi.compressVideo(
      File(pickedVideo.path),
    );

    if (info != null) {
      video = info.file;
      Get.back();
      videoPlayerController = VideoPlayerController.file(video!)
        ..initialize().then((_) {
          videoPlayerController!.play();
          update(['video', 'butvid']);
        });
    }
  }

  void notif(String judul, String msg) => Get.snackbar('title', 'message',
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(10),
      titleText:
          Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
      messageText:
          Text(msg, style: blackFontStyle2.copyWith(color: Colors.white)),
      backgroundColor: Colors.red[900]);

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

  void deleteFoto(String namaFile) {
    switch (namaFile) {
      case 'fotodepan':
        depan = null;
        update(['fotodepan']);
        break;
      case 'fotokanan':
        kanan = null;
        update(['fotokanan']);
        break;
      case 'fotokiri':
        kiri = null;
        update(['fotokiri']);
        break;
      case 'fotoktp':
        ktp = null;
        update(['fotoktp']);
        break;
      default:
        shopSign = null;
        update(['fotoshopsign']);
    }
    update(['butfoto']);
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
        case 'fotoktp':
          File convert = await convertImage(namaFile, pickedFile);
          ktp = convert;
          update(['fotoktp']);
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

  Future<bool> submit(
      String namaOutlet, String namaPemilik, String nomerPemilik) async {
    String kodeOutlet = namaOutlet.split(' ').last;
    List<File> images = [];
    if (ktp == null) {
      if (shopSign == null || depan == null || kanan == null || kiri == null) {
        notif('Salah', 'Foto belum lengkap');
        return false;
      } else {
        images.addAll([shopSign!, depan!, kanan!, kiri!]);
      }
    } else {
      if (shopSign == null ||
          depan == null ||
          kanan == null ||
          kiri == null ||
          ktp == null) {
        notif('Salah', 'Foto belum lengkap');
        return false;
      } else {
        if (video == null) {
          notif('Salah', 'Video belum lengkap');
          return false;
        } else {
          images.addAll([shopSign!, depan!, kanan!, kiri!, ktp!]);
        }
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String latlong = '${position.latitude},${position.longitude}';

    if (video == null) {
      notif('Salah', 'Video belum lengkap');
      return false;
    } else {
      notifLoading('tunggu', 'Sedang mengirim data');
      ApiReturnValue<bool> result = await OutletServices.updateOutlet(
          images, kodeOutlet, namaPemilik, nomerPemilik, latlong, video!);
      if (result.value!) {
        Get.back();
        return true;
      } else {
        print(result.message);
        notif("error", result.message!);
        Get.back();
        return false;
      }
    }
  }

  void dialog(String judul, String msg) {
    Get.defaultDialog(
      title: judul,
      titleStyle: blackFontStyle1,
      middleText: msg,
      middleTextStyle: blackFontStyle2,
      actions: [
        Container(
          width: double.infinity,
          child: Center(
            child: ElevatedButton(
              onPressed: () => Get.offAll(
                () => MainPage(),
              ),
              child: Text("OK"),
            ),
          ),
        )
      ],
    );
  }
}
