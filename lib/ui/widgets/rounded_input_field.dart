part of 'widgets.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final Icon? suficon;
  final TextAlign? awal;
  final bool obsecure;
  final double? lebarForm;
  const RoundedInputField(
      {Key? key,
      this.hintText,
      this.lebarForm,
      this.icon,
      this.onChanged,
      this.controller,
      this.obsecure = false,
      this.suficon,
      this.awal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        maxLines: 5,
        obscureText: obsecure,
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: suficon,
          icon: Icon(
            icon,
            color: Colors.grey,
          ),
          hintStyle: greyFontStyle.copyWith(fontSize: 14),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
