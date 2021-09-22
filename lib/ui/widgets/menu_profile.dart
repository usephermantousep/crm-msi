part of 'widgets.dart';

class MenuAccount extends StatelessWidget {
  final String? title;
  final Function()? onpress;
  final String? count;
  final IconData? mdiIcons;
  const MenuAccount({
    this.title,
    required this.onpress,
    this.count,
    this.mdiIcons,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Row(
          children: [
            Text(
              title!,
              style: blackFontStyle3,
            ),
            Spacer(),
            (count == null) ? SizedBox() : Text(count!),
            IconButton(
                icon: Icon(
                  mdiIcons!,
                  color: Colors.grey[500],
                  size: 18,
                ),
                onPressed: onpress!)
          ],
        ),
      ),
    );
  }
}
