part of 'widgets.dart';

class ListStatusNoo extends GetView<ListNooController> {
  final List<NooModel> noos;
  final String status;
  const ListStatusNoo({
    required this.status,
    required this.noos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 230,
      color: Colors.white,
      child: ListView.separated(
          itemBuilder: (_, i) {
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailNoo(noos[i], status));
              },
              child: ListTile(
                leading: Icon(
                  MdiIcons.storefront,
                  color: (status == 'STATUS : PENDING')
                      ? Colors.grey
                      : (status == 'STATUS : CONFIRMED')
                          ? Colors.yellow
                          : (status == 'STATUS : APPROVED')
                              ? Colors.green
                              : Colors.red,
                  size: 25,
                ),
                title: Text(
                  noos[i].namaOutlet!,
                  style: blackFontStyle3,
                ),
                subtitle: Text(
                    "${noos[i].region!.name!} || ${noos[i].namaPemilikOutlet!} || ${noos[i].nomerTlpOutlet!}"),
              ),
            );
          },
          separatorBuilder: (_, __) => Divider(height: 0.5),
          itemCount: noos.length),
    );
  }
}
