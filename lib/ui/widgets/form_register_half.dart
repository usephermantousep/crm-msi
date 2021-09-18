part of 'widgets.dart';

class FormRegisterHalf extends StatelessWidget {
  final TextEditingController controller;
  final String nama;
  final String? Function(String? val) validator;
  const FormRegisterHalf(
      {Key? key,
      required this.controller,
      required this.nama,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
            hintStyle: greyFontStyle,
            hintText: nama,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1))),
        validator: validator,
        controller: controller,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
