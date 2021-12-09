part of 'controllers.dart';

class ListNooController extends GetxController {
  int selectedIndex = 0;
  List<NooModel> noos = [];
  List<NooModel> lead = [];
  int? role;

  void changeMenu(int index) {
    selectedIndex = index;
    update(['menutab', 'listnoo']);
  }

  Future<void> getNoo() async {
    ApiReturnValue<List<NooModel>> result = await NooService.all();

    if (result.value != null) {
      noos = result.value!;
      lead = noos.where((e) => e.status == NooStatus.lead).toList();
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
