part of 'widgets.dart';

class TmBottomSheet extends StatelessWidget {
  const TmBottomSheet({
    Key? key,
    required this.controller,
    required this.isVisit,
  }) : super(key: key);

  final HomePageController controller;
  final bool isVisit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(defaultMargin),
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelFormRegisterHalf(
                  nama: "Pilih Divisi Outlet",
                  width: double.infinity,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownSearch<String>(
                    emptyBuilder: (context, message) => Center(
                      child: Text("Tidak ada daftar outlet plan"),
                    ),
                    showSearchBox: true,
                    searchBoxStyle: blackFontStyle2,
                    hint: "Cari Divisi....",
                    items: controller.divisi!.map((e) => e.name!).toList(),
                    popupItemBuilder: (_, item, __) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        item,
                        style: blackFontStyle2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onChanged: (String? value) async {
                      if (value != null) {
                        controller.selectedDivisi = null;
                        controller.selectedRegion = null;
                        controller.region = [];
                        controller.selectedDivisi = value;
                        await controller
                            .getRegion(controller.selectedDivisi!)
                            .then((value) => controller.region = value);

                        controller.updateManual();
                      }
                    },
                    searchBoxDecoration: InputDecoration(
                      hintText: "Cari Divisi ...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabelFormRegisterHalf(
                  nama: "Pilih Region Outlet",
                  width: double.infinity,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: DropdownSearch<String>(
                    emptyBuilder: (context, message) => Center(
                      child: Text("Tidak ada daftar outlet plan"),
                    ),
                    showSearchBox: true,
                    searchBoxStyle: blackFontStyle2,
                    hint: "Cari Region....",
                    items: (controller.region != null)
                        ? controller.region!.map((e) => e.name!).toList()
                        : [],
                    popupItemBuilder: (_, item, __) => Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        item,
                        style: blackFontStyle2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onChanged: (String? value) async {
                      if (value != null) {
                        controller.selectedRegion = null;
                        controller.selectedRegion = value;
                        controller.updateManual();
                      }
                    },
                    searchBoxDecoration: InputDecoration(
                      hintText: "Cari Region ...",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
                elevation: MaterialStateProperty.all(0)),
            onPressed: () {
              if (controller.selectedDivisi != null &&
                  controller.selectedRegion != null) {
                Get.back();
                Get.to(() => isVisit ? CheckInOutScreen() : PlanVisitScreen(),
                    arguments: {
                      'divisi': controller.selectedDivisi,
                      'region': controller.selectedRegion
                    });
                controller.selectedDivisi = null;
                controller.selectedRegion = null;
              } else {
                controller.notif("Salah", "pilih divisi dan region dahulu");
              }
            },
            child: Text(
              isVisit ? "Visit" : "Plan Visit",
              style: blackFontStyle3.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
