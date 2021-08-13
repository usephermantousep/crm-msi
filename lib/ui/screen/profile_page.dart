// part of 'screen.dart';

// class ProfilePage extends StatefulWidget {
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   int selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       body: SafeArea(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 232,
//               width: double.infinity,
//               decoration: BoxDecoration(color: Colors.white),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 110,
//                     height: 110,
//                     margin: EdgeInsets.only(top: 28),
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage('assets/photo_border.png'),
//                         ),
//                         color: Colors.white),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                             image: NetworkImage(
//                                 (context.read<UserCubit>().state as UserLoaded)
//                                     .user
//                                     .potoUrl!),
//                             fit: BoxFit.cover),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     (context.read<UserCubit>().state as UserLoaded).user.nama!,
//                     style: blackFontStyle1,
//                   ),
//                   Text(
//                     (context.read<UserCubit>().state as UserLoaded)
//                         .user
//                         .region!,
//                     style: greyFontStyle,
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               width: double.infinity,
//               color: Colors.white,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   CustomTabBar(
//                     titles: ["Outlet", "Noo"],
//                     selectedIndex: selectedIndex,
//                     onTap: (index) {
//                       setState(() {
//                         selectedIndex = index;
//                       });
//                     },
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Builder(
//                     builder: (context) {
//                       return (selectedIndex == 0)
//                           ? Column(
//                               children: [
//                                 MenuAccount(
//                                   title: "Outlet Total",
//                                   count: (context.read<OutletCubitCubit>().state
//                                           as OutletLoaded)
//                                       .outlets
//                                       .length
//                                       .toString(),
//                                   onpress: () {},
//                                   mdiIcons: MdiIcons.storefront,
//                                 ),
//                                 MenuAccount(
//                                   title: "Visited Today",
//                                   onpress: () {},
//                                   mdiIcons: MdiIcons.naturePeople,
//                                   count: (context.read<VisitCubit>().state
//                                           as VisitLoaded)
//                                       .visit
//                                       .length
//                                       .toString(),
//                                 ),
//                               ],
//                             )
//                           : Column(
//                               children: [
//                                 MenuAccount(
//                                   title: "Registered",
//                                   count: (context.read<NooCubit>().state
//                                           as NooLoaded)
//                                       .noos
//                                       .where((element) => element.status!
//                                           .contains(NooStatus.pending))
//                                       .toList()
//                                       .length
//                                       .toString(),
//                                   mdiIcons: MdiIcons.fileRefresh,
//                                   onpress: () {
//                                     print("object");
//                                     Get.to(
//                                       () => MainPage(
//                                         initialPage: 1,
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 MenuAccount(
//                                   title: "Confirmed",
//                                   count: (context.read<NooCubit>().state
//                                           as NooLoaded)
//                                       .noos
//                                       .where((element) => element.status!
//                                           .contains(NooStatus.confirmed))
//                                       .toList()
//                                       .length
//                                       .toString(),
//                                   mdiIcons: MdiIcons.fileCheck,
//                                   onpress: () {},
//                                 ),
//                                 MenuAccount(
//                                   title: "Approved",
//                                   count: (context.read<NooCubit>().state
//                                           as NooLoaded)
//                                       .noos
//                                       .where((element) => element.status!
//                                           .contains(NooStatus.approved))
//                                       .toList()
//                                       .length
//                                       .toString(),
//                                   mdiIcons: MdiIcons.checkAll,
//                                   onpress: () {},
//                                 ),
//                                 MenuAccount(
//                                   title: "Rejected",
//                                   count: (context.read<NooCubit>().state
//                                           as NooLoaded)
//                                       .noos
//                                       .where((element) => element.status!
//                                           .contains(NooStatus.rejected))
//                                       .toList()
//                                       .length
//                                       .toString(),
//                                   mdiIcons: MdiIcons.fileRemove,
//                                   onpress: () {},
//                                 ),
//                               ],
//                             );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
