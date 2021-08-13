part of 'widgets.dart';

class ListPlanVisitForm extends StatelessWidget {
  final List<PlanVisitModel>? data;
  const ListPlanVisitForm({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 350,
      color: Colors.white,
      child: (data!.length == 0)
          ? Container(
              child: Center(
                child: Text(
                  "Belum ada Histori",
                  style: blackFontStyle2,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (_, index) => ListTile(
                    title: Text(
                      data![index].namaOutlet!,
                      style: blackFontStyle2,
                    ),
                  ),
              separatorBuilder: (_, index) => Divider(
                    thickness: 3,
                  ),
              itemCount: data!.length),
    );
  }
}
