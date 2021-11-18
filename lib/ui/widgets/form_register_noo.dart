part of 'widgets.dart';

class FormRegisterNoo extends StatelessWidget {
  final String? nama;
  final TextEditingController controller;
  final bool obsecure;
  final String? Function(String? value) validator;
  final TextInputType? type;
  const FormRegisterNoo(
      {@required this.nama,
      Key? key,
      required this.controller,
      this.obsecure = false,
      required this.validator,
      this.type = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 9),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        keyboardType: type,
        style: blackFontStyle3,
        validator: validator,
        obscureText: obsecure,
        controller: controller,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintStyle: greyFontStyle,
          hintText: nama,
        ),
      ),
    );
  }
}
