part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];
  CameraPosition? initialCamera;
  double? lat, long;
  Marker? lokasi;
  VideoPlayerController? videoController;

  void changeMenu(int index) {
    selectedIndex = index;
    update(['menutab', 'listnoo']);
  }

  Future<void> getNoo(int id) async {
    ApiReturnValue<List<NooModel>> result = await NooService.bySales(id);

    if (result.value != null) {
      noos = result.value!;
    }
    update(['listnoo']);
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

  @override
  void onInit() async {
    getNoo(1);

    super.onInit();
  }
}
