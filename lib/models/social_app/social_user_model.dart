class SocialUserModel
{
  String image;
  String Uid;
  String name;
  String bio;
  String email;

  SocialUserModel.fromJson(Map<String , dynamic> json)
  {
    image = json['image'];
    Uid = json['Uid'];
    name = json['name'];
    bio = json['bio'];
    email = json['email'];
  }

  Map<String , dynamic> toJson()
  {
    return {
      'image':image,
      'Uid':Uid,
      'name':name,
      'bio':bio,
      'email':email,
    };
  }
}