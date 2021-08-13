part of 'screen.dart';

class ListRegisterNoo extends StatefulWidget {
  const ListRegisterNoo({Key? key}) : super(key: key);

  @override
  _ListRegisterNooState createState() => _ListRegisterNooState();
}

class _ListRegisterNooState extends State<ListRegisterNoo> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'NOO',
      subtitle: 'Status Noo',
      child: Container(
        child: Column(
          children: [
            CustomTabBar(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              paddingLeft: 0,
              titles: ['PENDING', 'CONFIRMED', 'APPROVED', 'REJECTED'],
              selectedIndex: selectedIndex,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
            BlocBuilder<NooCubit, NooState>(
              builder: (_, state) => (state is NooLoaded)
                  ? (selectedIndex == 0)
                      ? ListStatusNoo(
                          noos: (state.noos
                              .where((element) =>
                                  element.status!.contains(NooStatus.pending))
                              .toList()))
                      : (selectedIndex == 1)
                          ? ListStatusNoo(
                              noos: (state.noos
                                  .where((element) => element.status!
                                      .contains(NooStatus.confirmed))
                                  .toList()))
                          : (selectedIndex == 2)
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
                  : Center(
                      child: loadingIndicator,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
