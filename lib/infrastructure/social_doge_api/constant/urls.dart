// Project imports:
import 'package:social_doge/infrastructure/social_doge_api/constant/strings.dart';

class TwitterBase {
  static Uri base = Uri.https("twitter.com", "/");
  static Uri all = Uri.https(".twitter.com", "/");
  static Uri api = Uri.https("api.twitter.com", "/");
}

class TwitterGraphQL {
  static Uri graphQL = TwitterBase.base.resolve("i/api/graphql/");
  static Uri profileSpotlightsQuery = graphQL.resolve("${TwitterQueryId.profileSpotlightsQuery}/ProfileSpotlightsQuery");
  static Uri following = graphQL.resolve("${TwitterQueryId.following}/Following");
  static Uri followers = graphQL.resolve("${TwitterQueryId.followers}/Followers");
}
