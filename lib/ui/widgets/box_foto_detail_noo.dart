part of 'widgets.dart';

class BoxFotoDetailNoo extends StatelessWidget {
  const BoxFotoDetailNoo({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Get.to(()=>DetailFoto(foto : baseFile + image)),
      child: Container(
        height: 250,
        width: MediaQuery.of(context).size.width * 0.36,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.black),
            image: DecorationImage(
                image:
                    NetworkImage(baseFile + image),
                fit: BoxFit.fill)),
      ),
    );
  }
}
