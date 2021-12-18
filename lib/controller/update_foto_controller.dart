part of 'controllers.dart';

class UpdateFotoOutletController extends GetxController {
  File? video;
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

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    String latlong = '${position.latitude},${position.longitude}';

    if (video == null) {
      notif('Salah', 'Video belum ada');
      return false;
    } else {
      notifLoading('tunggu', 'Sedang mengirim data');
      ApiReturnValue<bool> result = await OutletServices.updateOutlet(
          kodeOutlet, namaPemilik, nomerPemilik, latlong, video!);
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
