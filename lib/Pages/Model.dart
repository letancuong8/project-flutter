class pointdb {
  String masinhvien;
  String tensinhvien;
  double diemchuyencan;
  double diemkiemtra1;
  double diemkiemtra2;
  double diemthi;
  double diemtongket;
  String id;

  pointdb(
      {this.masinhvien,
      this.tensinhvien,
      this.diemchuyencan,
      this.diemkiemtra1,
      this.diemkiemtra2,
      this.diemthi,
      this.diemtongket,
      this.id});

  pointdb.fromJson(Map<String, dynamic> json) {
    masinhvien = json['masinhvien'];
    tensinhvien = json['tensinhvien'];
    diemchuyencan = json['diemchuyencan'];
    diemkiemtra1 = json['diemkiemtra1'];
    diemkiemtra2 = json['diemkiemtra2'];
    diemthi = json['diemthi'];
    diemtongket = json['diemtongket'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['masinhvien'] = this.masinhvien;
    data['tensinhvien'] = this.tensinhvien;
    data['diemchuyencan'] = this.diemchuyencan;
    data['diemkiemtra1'] = this.diemkiemtra1;
    data['diemkiemtra2'] = this.diemkiemtra2;
    data['diemthi'] = this.diemthi;
    data['diemtongket'] = this.diemtongket;
    data['id'] = this.id;
    return data;
  }
}
