part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> = [];

  void changeMenu(int index) {
    selectedIndex = index;
  }

  @override
  void onInit() {
    Future<void> getNoo(int id) async {
      ApiReturnValue<List<NooModel>> result = await NooService.bySales(id);
    }



    super.onInit();
  }
}
