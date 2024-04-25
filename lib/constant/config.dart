import 'package:flutter/material.dart';

class Config {
  Config._();
  static String title = 'Social Doge';
  static String author = 'yuki';
  static String year = '2023';
  static String applicationLegalese = '$year $author';

  static String githubUser = 'fa0311';
  static String githubRepository = 'social_doge';

  static Uri github = Uri.https('github.com');
  static Uri twitter = Uri.https('twitter.com');
  static Uri googlePlay = Uri.https('play.google.com');
  static Uri githubApi = Uri.https('api.github.com');

  static Uri repository = Config.github.resolve('$githubUser/$githubRepository');
  static Uri releaseApi = Config.githubApi.resolve('repos/$githubUser/$githubRepository/releases');

  static Uri release = Config.github.resolve('$githubUser/$githubRepository/releases');
  static Uri report = Config.github.resolve('$githubUser/$githubRepository/issues/new');
  static Uri issues = Config.github.resolve('$githubUser/$githubRepository/issues/new/choose');

  static Uri contact = Config.twitter.resolve('faa0311');

  static bool debugShowCheckedModeBanner = false;
  static MaterialColor seedColor = Colors.blue;
}
