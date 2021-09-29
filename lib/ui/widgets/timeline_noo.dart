part of 'widgets.dart';

class TimelineNoo extends StatelessWidget {
  const TimelineNoo({
    Key? key,
    required this.data,
  }) : super(key: key);

  final NooModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 70,
            child: TimelineTile(
              indicatorStyle: IndicatorStyle(
                  height: 50, width: 20, color: Colors.blue[300]!),
              afterLineStyle: LineStyle(
                thickness: 2,
              ),
              endChild: Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Created by : ${data.user!.namaLengkap!}",
                      style: blackFontStyle2,
                    ),
                    Row(
                      children: [
                        Text(
                            '${DateFormat('d MMM yyyy HH:mm').format(data.createdAt!)}'),
                      ],
                    ),
                  ],
                ),
              ),
              isFirst: true,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: TimelineTile(
              afterLineStyle: LineStyle(
                thickness: 2,
              ),
              beforeLineStyle: LineStyle(
                thickness: 2,
              ),
              indicatorStyle: IndicatorStyle(
                  height: 50, width: 20, color: Colors.green[300]!),
              endChild: Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (data.approvedBy == null)
                          ? 'Approved by : -'
                          : "Approved by :  ${data.approvedBy}",
                      style: blackFontStyle2,
                    ),
                    Row(
                      children: [
                        Text((data.approvedAt == null)
                            ? '-'
                            : '${DateFormat('d MMM yyyy HH:mm').format(data.approvedAt!)}'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: TimelineTile(
              afterLineStyle: LineStyle(
                thickness: 2,
              ),
              beforeLineStyle: LineStyle(
                thickness: 2,
              ),
              indicatorStyle: IndicatorStyle(
                  height: 50, width: 20, color: Colors.red[300]!),
              endChild: Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (data.rejectedBy == null)
                          ? 'Rejected by : -'
                          : "Rejected by :  ${data.rejectedBy}",
                      style: blackFontStyle2,
                    ),
                    Row(
                      children: [
                        Text((data.rejectedAt == null)
                            ? '-'
                            : '${DateFormat('d MMM yyyy HH:mm').format(data.rejectedAt!)}'),
                      ],
                    ),
                  ],
                ),
              ),
              isLast: true,
            ),
          ),
        ],
      ),
    );
  }
}
