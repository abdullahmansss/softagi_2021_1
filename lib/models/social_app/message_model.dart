class MessageModel
{
  String senderUid;
  String receiverUid;
  String message;
  String time;

  MessageModel({
    this.senderUid,
    this.receiverUid,
    this.message,
    this.time,
});

  MessageModel.fromJson(Map<String , dynamic> json)
  {
    senderUid = json['senderUid'];
    receiverUid = json['receiverUid'];
    message = json['message'];
    time = json['time'];
  }

  Map<String , dynamic> toJson()
  {
    return {
      'senderUid':senderUid,
      'receiverUid':receiverUid,
      'message':message,
      'time':time,
    };
  }
}