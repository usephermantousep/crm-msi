part of 'screen.dart';

class CheckInOutScreen extends StatelessWidget {
  final controller = (Get.arguments == null)
      ? Get.put(CiCoController())
      : Get.put(CiCoController(
          divisi: Get.arguments['divisi'], region: Get.arguments['region']));
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      backColor: Colors.black,
      title: "Visit",
      subtitle: 'Live Visit',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              width: double.infinity,
              height: 285,
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Extra Call ?",
                        style: blackFontStyle3,
                      ),
                      GetBuilder<CiCoController>(
                        id: 'extracall',
                        builder: (con) {
                          return Switch(
                            value: con.isplaned.value,
                            onChanged: (value) {
                              con.changeListPlaned();
                              if (value) {
                                con.extraCall();
                              } else {
                                controller.getPlan();
                              }
                            },
                          );
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClockWidget(),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            // border: Border.all(color: Colors.black),
                          ),
                          margin: EdgeInsets.symmetric(
                            horizontal: defaultMargin,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: GetBuilder<CiCoController>(
                            id: 'dropdown',
                            builder: (_) => DropdownSearch<String>(
                              emptyBuilder: (context, message) => Center(
                                child: Text("Tidak ada daftar outlet plan"),
                              ),
                              showSearchBox: true,
                              searchBoxStyle: blackFontStyle2,
                              hint: "Cari Outlet....",
                              popupItemBuilder: (_, item, __) => Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  item,
                                  style: blackFontStyle2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              items: controller.showList,
                              onChanged: (String? value) async {
                                if (value != null) {
                                  controller.newSelected(value);
                                }
                              },
                              searchBoxDecoration: InputDecoration(
                                hintText: "Cari Outlet ...",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green[400]),
                                ),
                                onPressed: () async {
                                  if (controller.selectedOutlet == null) {
                                    {
                                      controller.notif('Salah',
                                          "Pilih outlet terlebih dahulu");
                                    }
                                  } else {
                                    await controller
                                        .checkFoto(controller.selectedOutlet!)
                                        .then((value) {
                                      if (value) {
                                        if (controller.foto != null) {
                                          controller.foto = null;
                                        }
                                        if (controller.selectedOutlet != null) {
                                          controller
                                              .check(controller.selectedOutlet!,
                                                  true)
                                              .then(
                                            (value) {
                                              if (value) {
                                                controller
                                                    .getLatlong(
                                                  controller.selectedOutlet!,
                                                  true,
                                                )
                                                    .then(
                                                  (value) {
                                                    if (value) {
                                                      Get.to(
                                                        () => GmapsScreen(
                                                          title: "Check In",
                                                          tipeVisit: (controller
                                                                  .isplaned
                                                                  .value)
                                                              ? 'EXTRACALL'
                                                              : 'PLANNED',
                                                        ),
                                                      );
                                                    }
                                                  },
                                                );
                                              }
                                            },
                                          );
                                        }
                                      } else {
                                        controller.notifUpdateFoto(
                                            controller.selectedOutlet!);
                                      }
                                    });
                                  }
                                },
                                child: Text(
                                  "Check In",
                                  style: blackFontStyle3.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      letterSpacing: 1.5),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: defaultMargin,
              width: double.infinity,
              color: "FAFAFC".toColor(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              color: Colors.white,
              child: Text(
                "Log Visit Today",
                style: blackFontStyle2,
              ),
            ),
            GetBuilder<CiCoController>(
              id: 'logvisit',
              builder: (_) {
                return ListLogVisit(data: controller.visits);
              },
            ),
          ],
        ),
      ),
    );
  }
}
