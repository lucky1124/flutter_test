class TourData {
  late String title;
  late String tel;
  late String zipcode;
  late String address;
  var id;
  var mapx;
  var mapy;
  late String imagePath;

  TourData(this.title, this.tel, this.zipcode, this.address, this.id, this.mapx,
      this.mapy, this.imagePath);

  TourData.fromJson(Map data)
      : id = data['contentid'],
        title = data['title'],
        tel = data['tel'],
        zipcode = data['zipcode'],
        address = data['addr1'],
        mapx = data['mapx'],
        mapy = data['mapy'],
        imagePath = data['firstimage'];

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'title': title,
      'tel': tel,
      'zipcode': zipcode,
      'address': address,
      'mapx': mapx,
      'mapy': mapy,
      'imagePath': imagePath,
    };
  }
}
