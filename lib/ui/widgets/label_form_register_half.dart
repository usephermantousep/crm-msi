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
      margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
      child: Text(
        nama!,
        style: blackFontStyle3,
      ),
    );
  }
}
