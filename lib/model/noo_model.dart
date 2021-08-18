part of 'models.dart';

enum NooStatus { pending, confirmed, approved, rejected }

class NooModel extends Equatable {
  final int? id;
  final String? namaOutlet;
  final String? namaPemilik;
  final String? nomerPemilik;
  final String? ktpNpwp;
  final String? alamatOutlet;
  final String? daerah;
  final String? kota;
  final String? collectKg;
  final String? fotloc;
  final String? tukarNoPemilik;
  final String? tukarNoWakil;
  final String? tukerNoFl;
  final String? keluhanInputan;
  final String? dataKeluhanInput;
  final String? oppo;
  final String? vivo;
  final String? realme;
  final String? xiaomi;
  final String? samsung;
  final String? fl;
  final String? fotoDepan;
  final String? fotoBelakang;
  final String? fotoKiri;
  final String? fotokanan;
  final String? fotoShopSign;
  final String? fotoEtalase;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? limit;
  final String? approvedAr;
  final String? approvedJejen;
  final DateTime? approvedARAt;
  final DateTime? approvedJejenAt;
  final List<NooStatus>? status;
  final String? latlong;
  final String? videoUrl;

  NooModel({
    this.id,
    this.namaOutlet,
    this.namaPemilik,
    this.nomerPemilik,
    this.ktpNpwp,
    this.alamatOutlet,
    this.daerah,
    this.kota,
    this.collectKg,
    this.fotloc,
    this.tukarNoPemilik,
    this.tukarNoWakil,
    this.tukerNoFl,
    this.keluhanInputan,
    this.dataKeluhanInput,
    this.oppo,
    this.vivo,
    this.realme,
    this.xiaomi,
    this.samsung,
    this.fl,
    this.fotoDepan,
    this.fotoBelakang,
    this.fotoKiri,
    this.fotokanan,
    this.fotoEtalase,
    this.fotoShopSign,
    this.createdAt,
    this.updatedAt,
    this.limit,
    this.approvedAr,
    this.approvedARAt,
    this.approvedJejen,
    this.status,
    this.approvedJejenAt,
    this.latlong,
    this.videoUrl,
  });

  @override
  List<Object?> get props => [
        id,
        namaOutlet,
        namaPemilik,
        alamatOutlet,
        daerah,
        kota,
        nomerPemilik,
        ktpNpwp,
        collectKg,
        fotloc,
        tukarNoPemilik,
        tukarNoWakil,
        tukerNoFl,
        keluhanInputan,
        dataKeluhanInput,
        oppo,
        vivo,
        realme,
        samsung,
        xiaomi,
        fl,
        fotoDepan,
        fotoBelakang,
        fotoEtalase,
        fotokanan,
        fotoKiri,
        fotoShopSign,
        createdAt,
        updatedAt,
        limit,
        approvedARAt,
        approvedAr,
        approvedJejen,
        approvedJejenAt,
        status,
        latlong,
        videoUrl
      ];

  factory NooModel.fromJson(Map<String, dynamic> data) => NooModel(
        id: data['id'],
      );
}

List<NooModel> mockNoo = [
  NooModel(
    id: 1,
    namaOutlet: "TOKO JMS A",
    namaPemilik: "YUKE A",
    ktpNpwp: "239592836493274",
    alamatOutlet: "Jl. Jagasatru No.31, RT.1/RW.7",
    nomerPemilik: "08765432132",
    daerah: "WJU",
    kota: "CIREBON",
    collectKg: "NO",
    fotloc: "YES",
    tukarNoPemilik: "YES",
    tukarNoWakil: "NO",
    tukerNoFl: "NO",
    keluhanInputan: "NO",
    dataKeluhanInput: null,
    oppo: "1",
    realme: "1",
    vivo: "1",
    samsung: "1",
    xiaomi: "0",
    fl: "2",
    fotoDepan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoBelakang: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoEtalase: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoKiri: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotokanan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoShopSign: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    limit: 10000000,
    approvedAr: "DINA",
    approvedARAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    approvedJejen: "APPROVED",
    approvedJejenAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    status: [NooStatus.pending],
    latlong: "-6.729463,108.5653881",
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  NooModel(
    id: 1,
    namaOutlet: "TOKO JMS B",
    namaPemilik: "YUKE B",
    ktpNpwp: "239592836493274",
    alamatOutlet: "Jl. Jagasatru No.31, RT.1/RW.7",
    nomerPemilik: "08765432132",
    daerah: "WJU",
    kota: "CIREBON",
    collectKg: "NO",
    fotloc: "YES",
    tukarNoPemilik: "YES",
    tukarNoWakil: "NO",
    tukerNoFl: "NO",
    keluhanInputan: "NO",
    dataKeluhanInput: null,
    oppo: "1",
    realme: "1",
    vivo: "1",
    samsung: "1",
    xiaomi: "0",
    fl: "2",
    fotoDepan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoBelakang: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoEtalase: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoKiri: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotokanan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoShopSign: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    limit: 10000000,
    approvedAr: "DINA",
    approvedARAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    approvedJejen: "APPROVED",
    approvedJejenAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    status: [NooStatus.confirmed],
    latlong: "-6.729463,108.5653881",
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  NooModel(
    id: 1,
    namaOutlet: "TOKO JMS C",
    namaPemilik: "YUKE C",
    ktpNpwp: "239592836493274",
    alamatOutlet: "Jl. Jagasatru No.31, RT.1/RW.7",
    nomerPemilik: "08765432132",
    daerah: "WJU",
    kota: "CIREBON",
    collectKg: "NO",
    fotloc: "YES",
    tukarNoPemilik: "YES",
    tukarNoWakil: "NO",
    tukerNoFl: "NO",
    keluhanInputan: "NO",
    dataKeluhanInput: null,
    oppo: "1",
    realme: "1",
    vivo: "1",
    samsung: "1",
    xiaomi: "0",
    fl: "2",
    fotoDepan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoBelakang: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoEtalase: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoKiri: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotokanan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoShopSign: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    limit: 10000000,
    approvedAr: "DINA",
    approvedARAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    approvedJejen: "APPROVED",
    approvedJejenAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    status: [NooStatus.approved],
    latlong: "-6.729463,108.5653881",
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  NooModel(
    id: 1,
    namaOutlet: "TOKO JMS D",
    namaPemilik: "YUKE D",
    ktpNpwp: "239592836493274",
    alamatOutlet: "Jl. Jagasatru No.31, RT.1/RW.7",
    nomerPemilik: "08765432132",
    daerah: "WJU",
    kota: "CIREBON",
    collectKg: "NO",
    fotloc: "YES",
    tukarNoPemilik: "YES",
    tukarNoWakil: "NO",
    tukerNoFl: "NO",
    keluhanInputan: "NO",
    dataKeluhanInput: null,
    oppo: "1",
    realme: "1",
    vivo: "1",
    samsung: "1",
    xiaomi: "0",
    fl: "2",
    fotoDepan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoBelakang: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoEtalase: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoKiri: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotokanan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoShopSign: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    limit: 10000000,
    approvedAr: "DINA",
    approvedARAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    approvedJejen: "APPROVED",
    approvedJejenAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    status: [NooStatus.rejected],
    latlong: "-6.729463,108.5653881",
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
  NooModel(
    id: 1,
    namaOutlet: "TOKO JMS E",
    namaPemilik: "YUKE E",
    ktpNpwp: "239592836493274",
    alamatOutlet: "Jl. Jagasatru No.31, RT.1/RW.7",
    nomerPemilik: "08765432132",
    daerah: "WJU",
    kota: "CIREBON",
    collectKg: "NO",
    fotloc: "YES",
    tukarNoPemilik: "YES",
    tukarNoWakil: "NO",
    tukerNoFl: "NO",
    keluhanInputan: "NO",
    dataKeluhanInput: null,
    oppo: "1",
    realme: "1",
    vivo: "1",
    samsung: "1",
    xiaomi: "0",
    fl: "2",
    fotoDepan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoBelakang: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoEtalase: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoKiri: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotokanan: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    fotoShopSign: "https://i.im.ge/2021/07/28/IDr9C.jpg",
    createdAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    updatedAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    limit: 10000000,
    approvedAr: "DINA",
    approvedARAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    approvedJejen: "APPROVED",
    approvedJejenAt: DateTime.fromMillisecondsSinceEpoch(1628154409356),
    status: [NooStatus.approved],
    latlong: "-6.729463,108.5653881",
    videoUrl:
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  ),
];
