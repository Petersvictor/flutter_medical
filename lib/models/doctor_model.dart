class DoctorModel {
  String name;
  String occupation;
  String availability;
  String profile;
  String image;
  String uid;
  String email;
  List<String> services;

  DoctorModel(
      { this.name,
        this.occupation,
        this.availability,
        this.profile,
        this.services,
        this.image,
        this.uid,
        this.email
      }
      );

  Map <String, dynamic> toJson() => {
    'name' : name,
    'occupation' : occupation,
    'availability' : availability,
    'profile' : profile,
    'services' : services,
    'image' : image,
    'uid' : uid,
    'email' : email
  };

  DoctorModel.fromMap(Map<String, dynamic> mapData) {
    this.uid = mapData['uid'];
    this.name = mapData['name'];
    this.email = mapData['email'];
    this.availability = mapData['availability'];
    this.image = mapData['image'];
    this.services = mapData['services'];
    this.occupation = mapData['occupation'];
    this.profile = mapData['profile'];
  }
}