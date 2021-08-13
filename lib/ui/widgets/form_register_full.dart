part of 'widgets.dart';

class FormRegisterFull extends StatelessWidget {
  final String? nama;
  final TextEditingController controller;
  final bool obsecure;
  const FormRegisterFull({
    @required this.nama,
    Key? key,
    required this.controller,
    this.obsecure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        obscureText: obsecure,
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none, hintStyle: greyFontStyle, hintText: nama),
      ),
    );
  }
}
