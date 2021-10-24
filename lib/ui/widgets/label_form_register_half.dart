part of 'widgets.dart';

class LabelFormRegisterHalf extends StatelessWidget {
  final String? nama;
  final double? width;
  const LabelFormRegisterHalf({
    required this.nama,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Text(
        nama!,
        style: blackFontStyle3,
      ),
    );
  }
}
