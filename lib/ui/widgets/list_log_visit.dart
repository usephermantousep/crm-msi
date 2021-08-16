part of 'widgets.dart';

class ListLogVisit extends StatelessWidget {
  final List<VisitModel>? data;
  const ListLogVisit({Key? key, required this.data}) : super(key: key);

  static String getDate(DateTime waktu) {
    return new DateFormat("hh:mm").format(waktu);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 470,
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(
                data![index].outlet!.namaOutlet!,
                style: blackFontStyle3,
              ),
              subtitle: Text(
                "CI : ${getDate(data![index].checkInTime!)} || CO : ${getDate(data![index].checkOutTime!)} || Durasi : ${data![index].durasiVisit!.toString()}",
                style: blackFontStyle3.copyWith(fontSize: 12),
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
