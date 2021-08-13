part of 'screen.dart';

class PlanVisitScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanVisitController>(builder: (controller) =>
    GeneralPage(
      title: 'Plan Visit',
      subtitle: 'Form',
      onBackButtonPressed: () {
        Get.back();
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin:
                      EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all("FF3F0A".toColor()),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () async {
                        showMonthPicker(
                          context: context,
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2031),
                          firstDate: DateTime(2021),
                        ).then((value) async {
                          if (value != null) {
                          }

                          
                        });
                      },
                      child: Text(
                        "Pilih Bulan",
                        style: blackFontStyle3.copyWith(color: Colors.white),
                      )),
                ),
                LabelFormRegisterHalf(
                    nama: (controller.selectedTime == null) ? '-' : controller.getDate(controller.selectedTime!))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabelFormRegisterHalf(
                  nama: "Pilih Outlet",
                ),
                GetBuilder<CiCoController>(builder: (con)=> DropDownHalf(
                          dropdownValue: con.selectedOutlet,
                          opsi: con.outlets.map((e) => e.namaOutlet!).toList(),
                          function: (val) {
                              selectedOutlet = val;
                          });),
                    
                
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: BlocBuilder<PlanVisitCubit, PlanVisitState>(
                builder: (_, state) {
                  if (state is PlanVisitLoaded) {
                    List<PlanVisitModel> result = state.data;
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all("FF3F0A".toColor()),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      onPressed: () async {
                        if (selectedOutlet != null && selectedTime != null) {
                          if (getDate(selectedTime!) ==
                              getDate(DateTime.now())) {
                            List isThere = result
                                .where(
                                    (item) => item.namaOutlet == selectedOutlet)
                                .toList();
                            if (isThere.length == 0) {
                              PlanVisitModel data = new PlanVisitModel(
                                  id: 4,
                                  bulan: getDate(selectedTime!),
                                  namaOutlet: selectedOutlet,
                                  namaSales: "USEP HERMANTO");
                              await context
                                  .read<PlanVisitCubit>()
                                  .addPlanVisit(data);
                            } else {
                              notif("Salah", "Outlet ini sudah masuk daftar");
                            }
                          } else {
                            notif("Salah",
                                "Hanya boleh mengisi di bulan sekarang");
                          }
                        } else {
                          notif("Salah", "Pilih bulan dan outlet dahulu");
                        }
                      },
                      child: Text(
                        "Tambah",
                        style: blackFontStyle3.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: loadingIndicator,
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            (selectedTime == null)
                ? Container(
                    height: MediaQuery.of(context).size.height - 350,
                    child: Center(
                      child: Text(
                        "Silahkan Pilih Bulan",
                        style: blackFontStyle2,
                      ),
                    ),
                  )
                : Container(
                    width: double.infinity,
                    child: BlocBuilder<PlanVisitCubit, PlanVisitState>(
                      builder: (_, state) {
                        if (state is PlanVisitLoaded) {
                          return ListPlanVisitForm(data: state.data);
                        } else {
                          return Container(
                            child: Center(
                              child: loadingIndicator,
                            ),
                          );
                        }
                      },
                    ),
                  )
          ],
        ),
      ),
    ));
     
  }
}
