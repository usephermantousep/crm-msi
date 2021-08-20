part of 'widgets.dart';

class BoxFotoRegistration extends StatelessWidget {
  final Function()? function;
  const BoxFotoRegistration({
    required this.function,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.37,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      child: Center(
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
              elevation: MaterialStateProperty.all(0)),
          onPressed: function!,
          child: Text("Upload"),
        ),
      ),
    );
  }
}
