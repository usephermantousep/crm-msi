part of 'widgets.dart';

class RoundedButton extends StatelessWidget {
  final String? text;
  final Function()? press;
  final Color? textColor, color;
  final Widget? child;
  final double? lebar;
  const RoundedButton(
      {Key? key,
      this.text,
      this.press,
      this.lebar,
      this.color,
      this.textColor = Colors.white,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      width: lebar,
      height: 50,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blue,
            ),
            padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
          ),
          onPressed: press,
          child: child,
        ),
      ),
    );
  }
}
