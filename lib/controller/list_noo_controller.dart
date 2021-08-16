part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];
  void changeMenu(int index) {
    selectedIndex = index;
    update();
  }

  Future<void> getNoo(int id) async {
    ApiReturnValue<List<NooModel>> result = await NooService.bySales(id);

    if (result.value != null) {
      noos = result.value!;
    }
    update();
  }

  @override
  void onInit() {
    getNoo(1);
    super.onInit();
  }
}
