part of 'widgets.dart';

class DropDownHalf extends StatelessWidget {
  const DropDownHalf({
    Key? key,
    required this.dropdownValue,
    required this.opsi,
    required this.function,
    required this.width,
    required this.validator,
  }) : super(key: key);

  final String? dropdownValue;
  final List<String> opsi;
  final Function(String? val) function;
  final double? width;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * width!,
      height: 75,
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 1))),
        autovalidateMode: AutovalidateMode.always,
        validator: validator,
        value: dropdownValue,
        isExpanded: true,
        style: blackFontStyle3,
        onChanged: function,
        items: opsi
            .map<DropdownMenuItem<String>>(
                (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    ))
            .toList(),
      ),
    );
  }
}
