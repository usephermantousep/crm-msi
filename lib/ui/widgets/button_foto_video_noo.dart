part of 'widgets.dart';

class ButtonFotoVideoNoo extends StatelessWidget {
  const ButtonFotoVideoNoo({
    Key? key,
    required this.controller,
    required this.data,
  }) : super(key: key);

  final ListNooController controller;
  final NooModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.generateLokasi(data.latlong!, data.video!);
              Get.to(
                () => DetailFotoDanMap(data: data),
              );
            },
            child: Text(
              "Foto dan Lokasi",
              style: blackFontStyle3.copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
                elevation: MaterialStateProperty.all(0)),
          ),
          ElevatedButton(
            onPressed: () {
              Get.to(() => VideoPlayerScreen(videoUrl: baseFile + data.video!));
            },
            child: Text(
              "Lihat Video",
              style: blackFontStyle3.copyWith(color: Colors.white),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all("FF3F0A".toColor()),
                elevation: MaterialStateProperty.all(0)),
          ),
        ],
      ),
    );
  }
}
