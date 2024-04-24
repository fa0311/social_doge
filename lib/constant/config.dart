import 'package:flutter/material.dart';

class Config {
  Config._();
  static String title = 'Social Doge';
  static String author = 'yuki';
  static String year = '2023';
  static String applicationLegalese = '$year $author';

  static Uri github = Uri.https('github.com');
  static Uri twitter = Uri.https('twitter.com');
  static Uri googlePlay = Uri.https('play.google.com');

  static Uri repository = Config.github.resolve('/fa0311/social_doge');

  static Uri githubApi = Uri.https('api.github.com');
  static Uri releaseApi = Config.githubApi.resolve('/repos/fa0311/social_doge/releases');

  static Uri issues = Config.github.resolve('/fa0311/social_doge/issues/new/choose');
  static Uri contact = Config.twitter.resolve('/faa0311');
  // static Uri rate = Config.googlePlay.replace(path: "/store/apps/details", queryParameters: {"id": "com.yuki0311.social_doge"});
  static Uri release = Config.github.resolve('/fa0311/social_doge/releases');
  static Uri report = Config.github.replace(path: '/fa0311/social_doge/issues/new', queryParameters: {'template': 'redirected-from-app.yml'});
  // static Uri report = Config.github.replace(path: "/fa0311/social_doge/issues/new", queryParameters: {"template": "redirected-from-app.yml"});
  // static Uri userPolicy = Config.github.resolve("/fa0311/social_doge/blob/master/docs/user_policies/ja.md");

  static bool debugShowCheckedModeBanner = false;
  static MaterialColor seedColor = Colors.blue;
}
