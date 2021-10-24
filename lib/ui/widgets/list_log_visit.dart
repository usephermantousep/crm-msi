part of 'widgets.dart';

class ListLogVisit extends GetView<CiCoController> {
  final List<VisitModel>? data;
  const ListLogVisit({Key? key, required this.data}) : super(key: key);

  static String getDate(DateTime waktu) {
    return new DateFormat("HH:mm").format(waktu);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 500,
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              trailing: (data![index].checkOutTime == null)
                  ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red[400]),
                      ),
                      child: Text(
                        "Check Out",
                        style: blackFontStyle3.copyWith(color: Colors.white),
                      ),
                      onPressed: () {
                        if (controller.foto != null) {
                          controller.foto = null;
                        }

                        controller
                            .getLatlong(data![index].outlet!.kodeOutlet!, false)
                            .then(
                              (value) => (value)
                                  ? Get.to(() => GmapsScreen(
                                        title: "Check Out",
                                        tipeVisit: (controller.isplaned.value)
                                            ? 'EXTRACALL'
                                            : 'PLANNED',
                                        kodeCsa:
                                            data![index].outlet!.kodeOutlet,
                                      ))
                                  : print("object"),
                            );
                      },
                    )
                  : null,
              title: Text(
                "${data![index].outlet!.namaOutlet} ${data![index].outlet!.kodeOutlet}",
                style: blackFontStyle2,
              ),
              subtitle: Text(
                (data![index].checkOutTime == null ||
                        data![index].durasiVisit == null)
                    ? "CI : ${getDate(data![index].checkInTime!)} || CO : - || Durasi : - || Jenis : ${data![index].tipeVisit}"
                    : "CI : ${getDate(data![index].checkInTime!)} || CO : ${getDate(data![index].checkOutTime!)} || Durasi : ${data![index].durasiVisit!.toString()} Menit || Jenis : ${data![index].tipeVisit}",
                style: blackFontStyle2.copyWith(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            );
          },
          separatorBuilder: (_, index) => Divider(
                thickness: 3,
              ),
          itemCount: data!.length),
    );
  }
}
