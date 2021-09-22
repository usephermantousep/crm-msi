part of 'share.dart';

Color mainColor = "FFC700".toColor();
Color greyColor = "8D92A3".toColor();

Widget loadingIndicator = SpinKitFadingCircle(
  size: 45,
  color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.montserrat().copyWith(color: greyColor);
TextStyle blackFontStyle1 = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.montserrat()
    .copyWith(color: Colors.black, fontWeight: FontWeight.w500);

const double defaultMargin = 24;

const String apiKeyGmaps = " AIzaSyAF52LhthHL4HQnmWYlZn1ach04xIid_gQ";
