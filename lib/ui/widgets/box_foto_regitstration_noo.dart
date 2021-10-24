part of 'widgets.dart';

class BoxFotoRegistrationNoo extends StatelessWidget {
  final File foto;

  const BoxFotoRegistrationNoo({required this.foto});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
        image: DecorationImage(image: FileImage(foto), fit: BoxFit.fill),
      ),
    );
  }
}
