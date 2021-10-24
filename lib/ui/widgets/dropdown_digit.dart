part of 'widgets.dart';

class OpsiDigitWidget extends StatelessWidget {
  const OpsiDigitWidget({
    Key? key,
    required this.controller,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.validator,
    required this.dropdownValue1,
    required this.dropdownValue2,
    required this.dropdownValue3,
  }) : super(key: key);

  final RegisterNooController controller;
  final String title1;
  final String title2;
  final String title3;
  final String text1;
  final String text2;
  final String text3;
  final String? dropdownValue1;
  final String? dropdownValue2;
  final String? dropdownValue3;

  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title1,
                  style: blackFontStyle3.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                DropDownHalf(
                    validator: validator,
                    dropdownValue: dropdownValue1,
                    opsi: controller.opsiAngka,
                    function: (String? val) {
                      if (val != null) {
                        controller.onChangeDigit(val, text1);
                      }
                    },
                    width: 0.2),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(
                  title2,
                  style: blackFontStyle3.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                DropDownHalf(
                    validator: validator,
                    dropdownValue: dropdownValue2,
                    opsi: controller.opsiAngka,
                    function: (String? val) {
                      if (val != null) {
                        controller.onChangeDigit(val, text2);
                      }
                    },
                    width: 0.2),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: defaultMargin),
            child: Column(
              children: [
                Text(
                  title3,
                  style: blackFontStyle3.copyWith(fontSize: 13),
                ),
                SizedBox(
                  height: 10,
                ),
                DropDownHalf(
                    validator: validator,
                    dropdownValue: dropdownValue3,
                    opsi: controller.opsiAngka,
                    function: (String? val) {
                      if (val != null) {
                        controller.onChangeDigit(val, text3);
                      }
                    },
                    width: 0.2),
              ],
            ),
          )
        ],
      ),
    );
  }
}
