part of 'widgets.dart';

class ListPlanVisit extends StatelessWidget {
  final List<PlanVisitModel> data;
  const ListPlanVisit({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 412,
      color: Colors.white,
      child: (data.length != 0)
          ? ListView.separated(
              itemBuilder: (_, index) => ListTile(
                    title: Text(
                      "${data[index].outlet!.namaOutlet} (${data[index].outlet!.kodeOutlet})",
                      style: blackFontStyle3.copyWith(fontSize: 14),
                    ),
                  ),
              separatorBuilder: (_, index) => Divider(
                    thickness: 3,
                  ),
              itemCount: data.length)
          : Center(
              child: Text(
                "Tidak ada plan visit hari ini",
                style: blackFontStyle2,
              ),
            ),
    );
  }
}
