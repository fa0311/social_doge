class ProfileImageUrlHttps {
  ProfileImageUrlHttps(String url) : match = from.firstMatch(url)!;
  static RegExp from = RegExp(r'^(https://.*?)_[a-zA-Z0-9]+?\.([a-z]+?)$');
  RegExpMatch match;

  String get profileImage => match.group(1)!;
  String get extension => match.group(2)!;

  String get original => '$profileImage.$extension';
  String get mini => '${profileImage}_mini.$extension';
  String get normal => '${profileImage}_normal.$extension';
  String get bigger => '${profileImage}_bigger.$extension';
  String get size_200x200 => '${profileImage}_200x200.$extension';
  String get size_400x400 => '${profileImage}_400x400.$extension';
}
