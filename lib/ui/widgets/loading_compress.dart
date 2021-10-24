part of 'widgets.dart';

class CompressDialog extends StatefulWidget {
  @override
  _CompressDialogState createState() => _CompressDialogState();
}

class _CompressDialogState extends State<CompressDialog> {
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
    final value = progress! / 100;

    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Compressing video .....',
            style: blackFontStyle1,
          ),
          SizedBox(
            height: 24,
          ),
          LinearProgressIndicator(
            value: value,
            minHeight: 12,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () => VideoCompress.cancelCompression(),
            child: Text("cancel"),
          ),
        ],
      ),
    );
  }
}
