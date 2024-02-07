class Casting{
  String? original_name;
  String? profile_path;
  String? character;

  Casting({this.original_name, this.profile_path, this.character});

  Casting.fromJson(Map<String, dynamic> json) {
    original_name= json['original_name'];
    profile_path= json['profile_path'];
    character= json['character'];
  }

}

