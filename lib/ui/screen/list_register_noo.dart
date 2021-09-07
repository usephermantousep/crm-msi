part of 'screen.dart';

class ListNooPage extends StatelessWidget {
  final controller = Get.put(ListNooController());
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'NOO',
      subtitle: 'Status',
      child: Container(
        child: Column(
          children: [
            GetBuilder<ListNooController>(
              id: 'menutab',
              builder: (_) {
                return CustomTabBar(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  paddingLeft: 0,
                  titles: ['PENDING', 'CONFIRMED', 'APPROVED', 'REJECTED'],
                  selectedIndex: controller.selectedIndex,
                  onTap: (index) {
                    controller.changeMenu(index);
                  },
                );
              },
            ),
            Container(
              child: GetBuilder<ListNooController>(
                  id: 'listnoo',
                  builder: (_) => (controller.selectedIndex == 0)
                      ? ListStatusNoo(
                          status: "STATUS : PENDING",
                          noos: (controller.noos
                              .where((element) =>
                                  element.status!.contains(NooStatus.pending))
                              .toList()),
                        )
                      : (controller.selectedIndex == 1)
                          ? ListStatusNoo(
                              status: "STATUS : CONFIRMED",
                              noos: (controller.noos
                                  .where((element) => element.status!
                                      .contains(NooStatus.confirmed))
                                  .toList()),
                            )
                          : (controller.selectedIndex == 2)
                              ? ListStatusNoo(
                                  status: "STATUS : APPROVED",
                                  noos: (controller.noos
                                      .where((element) => element.status!
                                          .contains(NooStatus.approved))
                                      .toList()),
                                )
                              : ListStatusNoo(
                                  status: "STATUS : REJECTED",
                                  noos: (controller.noos
                                      .where((element) => element.status!
                                          .contains(NooStatus.rejected))
                                      .toList()),
                                )),
            ),
          ],
        ),
      ),
    );
  }
}
