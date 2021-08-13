// part of 'screen.dart';

// class PlanVisitScreen extends StatefulWidget {
//   const PlanVisitScreen({Key? key}) : super(key: key);

//   @override
//   _PlanVisitScreenState createState() => _PlanVisitScreenState();
// }

// class _PlanVisitScreenState extends State<PlanVisitScreen> {
//   DateTime? selectedTime;
//   String? selectedOutlet;

//   static String getDate(DateTime now) {
//     return new DateFormat("MMMM, y").format(now);
//   }

//   static String getIntMonth(DateTime now) {
//     return new DateFormat("M").format(now);
//   }

//   void notif(String judul, String pesan) {
//     Get.snackbar('title', 'message',
//         snackPosition: SnackPosition.BOTTOM,
//         margin: EdgeInsets.only(bottom: 10),
//         titleText:
//             Text(judul, style: blackFontStyle1.copyWith(color: Colors.white)),
//         messageText:
//             Text(pesan, style: blackFontStyle2.copyWith(color: Colors.white)),
//         backgroundColor: "FF3F0A".toColor());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GeneralPage(
//       title: 'Plan Visit',
//       subtitle: 'Form',
//       onBackButtonPressed: () {
//         Get.back();
//       },
//       child: Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   margin:
//                       EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
//                   child: ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all("FF3F0A".toColor()),
//                         elevation: MaterialStateProperty.all(0),
//                       ),
//                       onPressed: () async {
//                         showMonthPicker(
//                           context: context,
//                           initialDate: DateTime.now(),
//                           lastDate: DateTime(2031),
//                           firstDate: DateTime(2021),
//                         ).then((value) async {
//                           if (value != null) {
//                             await context.read<PlanVisitCubit>().getPlanByMonth(
//                                   1,
//                                   getIntMonth(value).toInt(),
//                                 );
//                           }

//                           setState(() {
//                             selectedTime = value;
//                           });
//                         });
//                       },
//                       child: Text(
//                         "Pilih Bulan",
//                         style: blackFontStyle3.copyWith(color: Colors.white),
//                       )),
//                 ),
//                 LabelFormRegisterHalf(
//                     nama: (selectedTime == null) ? '-' : getDate(selectedTime!))
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 LabelFormRegisterHalf(
//                   nama: "Pilih Outlet",
//                 ),
//                 BlocBuilder<OutletCubitCubit, OutletCubitState>(
//                   builder: (_, state) {
//                     if (state is OutletLoaded) {
//                       List<String> outlets =
//                           state.outlets.map((e) => e.namaOutlet!).toList();
//                       return DropDownHalf(
//                           dropdownValue: selectedOutlet,
//                           opsi: outlets,
//                           function: (val) {
//                             setState(() {
//                               selectedOutlet = val;
//                             });
//                           });
//                     }
//                     return Center(child: loadingIndicator);
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Center(
//               child: BlocBuilder<PlanVisitCubit, PlanVisitState>(
//                 builder: (_, state) {
//                   if (state is PlanVisitLoaded) {
//                     List<PlanVisitModel> result = state.data;
//                     return ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.all("FF3F0A".toColor()),
//                         elevation: MaterialStateProperty.all(0),
//                       ),
//                       onPressed: () async {
//                         if (selectedOutlet != null && selectedTime != null) {
//                           if (getDate(selectedTime!) ==
//                               getDate(DateTime.now())) {
//                             List isThere = result
//                                 .where(
//                                     (item) => item.namaOutlet == selectedOutlet)
//                                 .toList();
//                             if (isThere.length == 0) {
//                               PlanVisitModel data = new PlanVisitModel(
//                                   id: 4,
//                                   bulan: getDate(selectedTime!),
//                                   namaOutlet: selectedOutlet,
//                                   namaSales: "USEP HERMANTO");
//                               await context
//                                   .read<PlanVisitCubit>()
//                                   .addPlanVisit(data);
//                             } else {
//                               notif("Salah", "Outlet ini sudah masuk daftar");
//                             }
//                           } else {
//                             notif("Salah",
//                                 "Hanya boleh mengisi di bulan sekarang");
//                           }
//                         } else {
//                           notif("Salah", "Pilih bulan dan outlet dahulu");
//                         }
//                       },
//                       child: Text(
//                         "Tambah",
//                         style: blackFontStyle3.copyWith(
//                           color: Colors.white,
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Center(
//                       child: loadingIndicator,
//                     );
//                   }
//                 },
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             (selectedTime == null)
//                 ? Container(
//                     height: MediaQuery.of(context).size.height - 350,
//                     child: Center(
//                       child: Text(
//                         "Silahkan Pilih Bulan",
//                         style: blackFontStyle2,
//                       ),
//                     ),
//                   )
//                 : Container(
//                     width: double.infinity,
//                     child: BlocBuilder<PlanVisitCubit, PlanVisitState>(
//                       builder: (_, state) {
//                         if (state is PlanVisitLoaded) {
//                           return ListPlanVisitForm(data: state.data);
//                         } else {
//                           return Container(
//                             child: Center(
//                               child: loadingIndicator,
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
