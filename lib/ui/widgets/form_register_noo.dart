part of 'widgets.dart';

class FormRegisterNoo extends StatelessWidget {
  final String? nama;
  final TextEditingController controller;
  final bool obsecure;
  final String? Function(String? value) validator;
  const FormRegisterNoo({
    @required this.nama,
    Key? key,
    required this.controller,
    this.obsecure = false,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 9),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
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
