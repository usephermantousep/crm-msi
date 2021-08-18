part of 'widgets.dart';

class ListPlanVisit extends StatelessWidget {
  final List<PlanVisitModel> data;
  const ListPlanVisit({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 495,
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (_, index) => ListTile(
                title: Text(
                  data[index].namaOutlet!,
                  style: blackFontStyle2,
                ),
              ),
          separatorBuilder: (_, index) => Divider(
                thickness: 3,
              ),
          itemCount: data.length),
    );
  }
}
