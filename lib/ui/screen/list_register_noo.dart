part of 'screen.dart';

class ListRegisterNoo extends StatelessWidget {
  final controller = Get.put(ListNooController());
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'NOO',
      subtitle: 'Status Noo',
      child: Container(
        child: Column(
          children: [
            GetBuilder<ListNooController>(
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
                  builder: (_) => (controller.selectedIndex == 0)
                      ? ListStatusNoo(
                          noos: (controller.noos
                              .where((element) =>
                                  element.status!.contains(NooStatus.pending))
                              .toList()),
                        )
                      : (controller.selectedIndex == 1)
                          ? ListStatusNoo(
                              noos: (controller.noos
                                  .where((element) => element.status!
                                      .contains(NooStatus.confirmed))
                                  .toList()),
                            )
                          : (controller.selectedIndex == 2)
                              ? ListStatusNoo(
                                  noos: (controller.noos
                                      .where((element) => element.status!
                                          .contains(NooStatus.approved))
                                      .toList()),
                                )
                              : ListStatusNoo(
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
