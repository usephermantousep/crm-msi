part of 'screen.dart';

class LeadListScreen extends GetView<ListNooController> {
  const LeadListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      title: 'LEAD',
      subtitle: 'Outlet List',
      onBackButtonPressed: () => Get.back(),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 150,
          alignment: Alignment.center,
          child: RefreshIndicator(
            onRefresh: () => controller.getNoo(),
            child: GetBuilder<ListNooController>(
              id: 'listlead',
              builder: (_) => ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0.2, color: greyColor),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 3,
                    child: Container(
                      alignment: Alignment.center,
                      height: 140,
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10, top: 10),
                                  child: Text(
                                    controller.lead[index].namaOutlet!,
                                    style:
                                        blackFontStyle1.copyWith(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  right: 10,
                                  top: 10,
                                ),
                                child: Text(
                                  "${DateFormat('dd MMMM y').format(controller.lead[index].createdAt!)}",
                                  style: blackFontStyle1.copyWith(
                                      fontSize: 16, color: greyColor),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/sam.png'),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .lead[index].namaPemilikOutlet!,
                                        style: blackFontStyle3,
                                      ),
                                      Text(
                                        "${controller.lead[index].alamatOutlet!} - ${controller.lead[index].distric!}",
                                        style: blackFontStyle3.copyWith(
                                          color: greyColor,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Region - Cluster :",
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 10, color: greyColor),
                                    ),
                                    Text(
                                      "${controller.lead[index].region!.name} - ${controller.lead[index].cluster!.name}",
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Telepon :",
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 10, color: greyColor),
                                    ),
                                    Text(
                                      controller.lead[index].nomerTlpOutlet!,
                                      style: blackFontStyle3.copyWith(
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.all(6),
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text("Lihat Foto dan Video",
                                        style: blackFontStyle3.copyWith(
                                            fontSize: 10))),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                itemCount: controller.lead.length,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
