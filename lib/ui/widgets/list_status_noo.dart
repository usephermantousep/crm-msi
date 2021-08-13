part of 'widgets.dart';

class ListStatusNoo extends StatelessWidget {
  final List<NooModel>? noos;
  const ListStatusNoo({
    this.noos,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 10),
      height: MediaQuery.of(context).size.height - 100,
      color: Colors.white,
      child: GestureDetector(
        onTap: () {
          print("tap!!");
        },
        child: ListView.separated(
            itemBuilder: (_, i) {
              return ListTile(
                leading: Icon(
                  MdiIcons.storefront,
                  size: 25,
                ),
                title: Text(
                  noos![i].namaOutlet!,
                  style: blackFontStyle3,
                ),
                subtitle: Text(noos![i].daerah! +
                    " || " +
                    noos![i].namaPemilik! +
                    " || " +
                    noos![i].nomerPemilik!),
              );
            },
            separatorBuilder: (_, __) => Divider(height: 0.5),
            itemCount: noos!.length),
      ),
    );
  }
}
