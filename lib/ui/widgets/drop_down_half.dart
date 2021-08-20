part of 'widgets.dart';

class DropDownHalf extends StatelessWidget {
  const DropDownHalf({
    Key? key,
    required this.dropdownValue,
    required this.opsi,
    required this.function,
    required this.width,
  }) : super(key: key);

  final String? dropdownValue;
  final List<String> opsi;
  final Function(String? val) function;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * width!,
      child: DropdownButton<String>(
        underline: SizedBox(),
        value: dropdownValue,
        isExpanded: true,
        style: blackFontStyle3,
        onChanged: function,
        items: opsi.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
