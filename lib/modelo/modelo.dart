class Post {
  int char_Id;
  String name;
  String birthday;
  List occupation = [];
  String img;
  String status;
  List appearance = [];
  String nickname;
  String portrayed;

  Post(
      {required this.char_Id,
      required this.name,
      required this.birthday,
      required this.occupation,
      required this.img,
      required this.status,
      required this.appearance,
      required this.nickname,
      required this.portrayed});
}
