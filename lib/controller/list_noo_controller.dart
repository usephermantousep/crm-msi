part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];
  int? role;

  void changeMenu(int index) {
    selectedIndex = index;
    update(['menutab', 'listnoo']);
  }

  Future<void> getNoo() async {
    ApiReturnValue<List<NooModel>> result = await NooService.all();

    if (result.value != null) {
      noos = result.value!;
      update(['listnoo', 'timeline', 'listlead']);
    }
  }

  @override
  void onInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getInt('role');
    getNoo();
    super.onInit();
  }
}
