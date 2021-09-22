part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];
  CameraPosition? initialCamera;
  double? lat, long;
  Marker? lokasi;
  VideoPlayerController? videoController;
  String? role;
  late TextEditingController limit, alasan;

  void changeMenu(int index) {
    selectedIndex = index;
    update(['menutab', 'listnoo']);
  }

  Future<void> getNoo(String role) async {
    print(role);
    ApiReturnValue<List<NooModel>> result = await NooService.all(role);

    if (result.value != null) {
      noos = result.value!;
      print(noos);
    }
    update(['listnoo', 'timeline']);
  }

  void loading() {
    Get.defaultDialog(
        title: 'LOADING ....',
        titleStyle: blackFontStyle1,
        middleTextStyle: blackFontStyle3,
        middleText: "Sedang proses update",
        actions: [CircularProgressIndicator()]);
  }

  void generateLokasi(String data, String videoUrl) {
    videoController = VideoPlayerController.network(videoUrl)..initialize();

    List<String> position = data.split(',').map((e) => e).toList();
    for (var i = 0; i < position.length; i++) {
      if (i == 0) {
        lat = double.parse(position[i]);
      } else {
        long = double.parse(position[i]);
      }
    }
    initialCamera = CameraPosition(
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

    update();
  }

  Future<bool> confirm(String id, {String? limit}) async {
    loading();
    late ApiReturnValue<bool> result;
    if (limit != null) {
      result = await NooService.confirm(id, limit: limit);
    } else {
      result = await NooService.confirm(id);
    }

    if (result.value != null) {
      if (result.value!) {
        Get.back();
        notif('Berhasil', result.message!);
        return true;
      } else {
        Get.back();
        notif('Gagal', result.message!);
        return false;
      }
    } else {
      Get.back();
      notif('Gagal', result.message!);
      return false;
    }
  }

  Future<bool> reject(String id, String alasan) async {
    loading();
    if (alasan.trim() == '' || alasan.isBlank!) {
      Get.back();
      notif("Salah", "Alasan harus di isi");
      return false;
    } else {
      ApiReturnValue<bool> result = await NooService.reject(id, alasan);
      if (result.value != null) {
        if (result.value!) {
          Get.back();
          notif("Berhasil", result.message!);
          return true;
        } else {
          Get.back();
          notif('Gagal', result.message!);
          return false;
        }
      } else {
        Get.back();
        notif("error", 'ada kesalahan');
        return false;
      }
    }
  }

  void notif(String judul, String msg) {
    Get.snackbar('title', 'message',
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(10),
        titleText:
            Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
        messageText:
            Text(msg, style: blackFontStyle2.copyWith(color: Colors.white)),
        backgroundColor: Colors.red[900]);
  }

  @override
  void onInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role');
    getNoo(role!);
    if (role != 'SALES') {
      limit = TextEditingController();
      alasan = TextEditingController();
    }
    super.onInit();
  }
}
