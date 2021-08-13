part of 'widgets.dart';

class FormRegisterHalf extends StatelessWidget {
  final TextEditingController controller;
  final String nama;
  const FormRegisterHalf(
      {Key? key, required this.controller, required this.nama})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.36,
      margin: EdgeInsets.symmetric(horizontal: defaultMargin),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: InputBorder.none, hintStyle: greyFontStyle, hintText: nama),
      ),
    );
  }
}
