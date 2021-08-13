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
              subtitle: Text(
                "Check In : " +
                    getDate(data![index].tanggalVisit!) +
                    " || " +
                    "Check Out : " +
                    getDate(data![index].tanggalVisit!),
                style: blackFontStyle3,
              ),
              title: Text(
                data![index].outlet!.namaOutlet!,
                style: blackFontStyle2,
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
