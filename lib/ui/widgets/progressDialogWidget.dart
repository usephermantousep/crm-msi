import 'package:crm_msi/shared/share.dart';
import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';
import 'package:video_compress/video_compress.dart';

class ProgressDialogWidget extends StatefulWidget {
  const ProgressDialogWidget({Key? key}) : super(key: key);

  @override
  _ProgressDialogWidgetState createState() => _ProgressDialogWidgetState();
}

class _ProgressDialogWidgetState extends State<ProgressDialogWidget> {
  late Subscription subscription;
  double? progress;

  @override
  void initState() {
    super.initState();
    subscription = VideoCompress.compressProgress$
        .subscribe((progress) => setState(() => this.progress = progress));
  }

  @override
  void dispose() {
    VideoCompress.cancelCompression();
    subscription.unsubscribe();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final value = progress == null ? progress : progress! / 100;
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Compressing video',
            style: blackFontStyle1,
          ),
          SizedBox(
            height: defaultMargin,
          ),
          LinearProgressIndicator(
            color: "FF3F0A".toColor(),
            value: value,
            minHeight: 12,
          ),
          Text(
            progress!.toInt().toString() + ' %',
            style: blackFontStyle1,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
              onPressed: () {
                VideoCompress.cancelCompression();
                Navigator.of(context).pop();
              },
              child: Text(
                'cancel',
                style: blackFontStyle2.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
