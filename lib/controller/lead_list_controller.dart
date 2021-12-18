part of 'controllers.dart';

class LeadListController extends GetxController {
  List<NooModel> lead = [];
  TextEditingController ktp = TextEditingController();
  File? ktpFoto;
  final submitFormKey = GlobalKey<FormState>();

  Future<void> getNoo() async {
    ApiReturnValue<List<NooModel>> result = await NooService.all();

    if (result.value != null) {
      lead = result.value!.where((e) => e.status == NooStatus.lead).toList();
      update(['listlead']);
    }
  }

  @override
  void onInit() async {
    getNoo();
    super.onInit();
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
      File convert = await convertImage(namaFile, pickedFile);
      ktpFoto = convert;
      Get.back();
      update(['fotoktp']);
    }
    if (pickedFile == null) {
      Get.back();
    }
  }

  Future<ApiReturnValue<bool>> submit(int id, String noKtp, File? ktp) async {
    if (submitFormKey.currentState!.validate()) {
      if (ktp != null) {
        notifLoading("Tunggu", "Sedang mengirim data");
        ApiReturnValue<bool> result =
            await NooService.submitKtp(id, noKtp, ktp);
        if (result.value!) {
          Get.back();
          return ApiReturnValue(value: true, message: "Berhasil update lead");
        } else {
          Get.back();
          return ApiReturnValue(value: false, message: "Gagal update lead");
        }
      } else {
        return ApiReturnValue(value: false, message: "Foto KTP wajib");
      }
    } else {
      return ApiReturnValue(value: false, message: "No KTP wajib diisi");
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
}
