part of 'widgets.dart';

class OpsiDigitWidget extends StatelessWidget {
  const OpsiDigitWidget({
    Key? key,
    required this.controller,
    required this.text1,
    required this.text2,
    required this.title1,
    required this.title2,
    this.dropdownValue1,
    this.dropdownValue2,
  }) : super(key: key);

  final RegisterNooController controller;
  final String title1;
  final String title2;
  final String text1;
  final String text2;
  final String? dropdownValue1;
  final String? dropdownValue2;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  child: Text(
                    title1,
                    style: blackFontStyle3,
                  ),
                ),
                DropDownHalf(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  child: Text(
                    title2,
                    style: blackFontStyle3,
                  ),
                ),
                DropDownHalf(
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
          )
        ],
      ),
    );
  }
}
