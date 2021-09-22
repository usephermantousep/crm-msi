part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];

  String? role;

  void changeMenu(int index) {
    selectedIndex = index;
    update(['menutab', 'listnoo']);
  }

  Future<void> getNoo(String role) async {
    ApiReturnValue<List<NooModel>> result = await NooService.all(role);

    if (result.value != null) {
      noos = result.value!;
    }
    update(['listnoo', 'timeline']);
  }

  @override
  void onInit() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    role = pref.getString('role');
    getNoo(role!);
    super.onInit();
  }
}
