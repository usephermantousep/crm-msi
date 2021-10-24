part of 'widgets.dart';

class FormRegisterFull extends GetView<LoginController> {
  final String nama;
  final bool isPassword;
  final TextEditingController con;

  FormRegisterFull({
    required this.nama,
    required this.isPassword,
    Key? key,
    required this.con,
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
      child: isPassword
          ? Obx(() => TextField(
                obscureText: controller.obsecure.value,
                controller: con,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => controller.obsecure.toggle(),
                      icon: controller.obsecure.value
                          ? Icon(
                              MdiIcons.eye,
                              color: Colors.blue,
                            )
                          : Icon(
                              MdiIcons.eyeOff,
                              color: Colors.red,
                            ),
                    ),
                    border: InputBorder.none,
                    hintStyle: greyFontStyle,
                    hintText: nama),
              ))
          : TextField(
              controller: con,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: greyFontStyle,
                  hintText: nama),
            ),
    );
  }
}
