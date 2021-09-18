part of 'widgets.dart';

class LabelFormRegisterHalf extends StatelessWidget {
  final String? nama;
  const LabelFormRegisterHalf({
    @required this.nama,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Text(
        nama!,
        style: blackFontStyle3,
      ),
    );
  }
}
