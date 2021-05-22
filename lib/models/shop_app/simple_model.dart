class SimpleModel
{
  bool status;
  String message;

  SimpleModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
  }
}