part of 'screen.dart';

class ListOutlet extends GetView<ProfileController> {
  ListOutlet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: "List Outlet",
      onBackButtonPressed: () => Get.back(),
      subtitle: "All Outlet",
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: defaultMargin),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.7,
              child: GetBuilder<ProfileController>(
                id: 'dropdown',
                builder: (_) => DropdownSearch<OutletModel>(
                  emptyBuilder: (context, message) => Center(
                    child: Text("Tidak ada daftar outlet"),
                  ),
                  showSearchBox: true,
                  searchBoxStyle: blackFontStyle2,
                  showClearButton: true,
                  hint: "Cari Outlet....",
                  popupItemBuilder: (_, item, __) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text(
                      item.namaOutlet!,
                      style: blackFontStyle2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  itemAsString: (OutletModel outlet) => outlet.namaOutlet!,
                  items: controller.outlets,
                  onChanged: (OutletModel? value) async {
                    if (value != null) {
                      Get.to(() => DetailOutlet(outlet: value));
                    }
                  },
                  searchBoxDecoration: InputDecoration(
                    hintText: "Cari Outlet ...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
