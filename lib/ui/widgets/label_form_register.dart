part of 'widgets.dart';

class LabelFormRegister extends StatelessWidget {
  final String? nama;
  const LabelFormRegister({
    @required this.nama,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(defaultMargin, 16, defaultMargin, 6),
      child: Text(
        nama!,
        style: blackFontStyle2,
      ),
    );
  }
}
