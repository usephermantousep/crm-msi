part of 'screen.dart';

class ListRegisterNoo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListNooController>(
        builder: (controller) => GeneralPage(
              title: 'NOO',
              subtitle: 'Status Noo',
              child: Container(
                child: Column(
                  children: [
                    CustomTabBar(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      paddingLeft: 0,
                      titles: ['PENDING', 'CONFIRMED', 'APPROVED', 'REJECTED'],
                      selectedIndex: controller.selectedIndex,
                      onTap: (index) {
                        controller.changeMenu(index);
                      },
                    ),
                    (controller.selectedIndex == 0)
                        ? ListStatusNoo(
                            noos: (state.noos
                                .where((element) =>
                                    element.status!.contains(NooStatus.pending))
                                .toList()))
                        : (controller.selectedIndex == 1)
                            ? ListStatusNoo(
                                noos: (state.noos
                                    .where((element) => element.status!
                                        .contains(NooStatus.confirmed))
                                    .toList()))
                            : (controller.selectedIndex == 2)
                                ? ListStatusNoo(
                                    noos: (state.noos
                                        .where((element) => element.status!
                                            .contains(NooStatus.approved))
                                        .toList()))
                                : ListStatusNoo(
                                    noos: (state.noos
                                        .where((element) => element.status!
                                            .contains(NooStatus.rejected))
                                        .toList()))
                  ],
                ),
              ),
            ));
  }
}
