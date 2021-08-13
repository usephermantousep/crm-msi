part of 'widgets.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget? child;
  final double? lebar;
  const TextFieldContainer({
    Key? key,
    this.child,
    this.lebar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: "FE5627".toColor(), width: 2)),
      child: child,
    );
  }
}
