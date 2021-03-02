class Users {
  String name;
  String address;
  String height;
  String weight;
  String phoneNumber;
  String bloodGroup;
  String url;
  String uid;
  String email;
  Map maps;
  List<String> diseases;

  Users(
{     this.name,
      this.address,
      this.url,
      this.height,
      this.weight,
      this.bloodGroup,
      this.diseases,
      this.phoneNumber,
      this.maps,
      this.uid,
      this.email
}
      );

  Map <String, dynamic> toJson() => {
    'name' : name,
    'address' : address,
    'height' : height,
    'weight' : weight,
    'bloodGroup' : bloodGroup,
    'diseases' : diseases,
    'url' : url,
    'maps' : maps,
    'phonenumber' : phoneNumber,
    'uid'  : uid,
    'email' : email
  };

  Users.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.phoneNumber = mapData['username'];
    this.address = mapData['address'];
    this.url = mapData['url'];
  }
}