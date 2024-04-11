import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/database/data.dart';
import 'package:url_launcher/url_launcher.dart';

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

class UserProfile extends HookConsumerWidget {
  const UserProfile({super.key, required this.user});
  final UserTableData user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3333,
          child: (user.profileBannerUrl == null)
              ? Container()
              : CachedNetworkImage(
                  imageUrl: user.profileBannerUrl!,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                ),
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -50,
              left: 20,
              child: SizedBox(
                height: 100,
                width: 100,
                child: CachedNetworkImage(
                  imageUrl: ProfileImageUrlHttps(user.profileImageUrl).original,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.fill,
                  imageBuilder: (context, imageProvider) {
                    return CircleAvatar(backgroundImage: imageProvider);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final url = Uri.https('twitter.com', 'intent/user', {'user_id': user.twitterId});
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url, mode: LaunchMode.externalApplication);
                          }
                        },
                        child: Text(AppLocalizations.of(context)!.viewWeb),
                      ),
                    ],
                  ),
                  Text(user.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  Text('${AppLocalizations.of(context)!.twitterAccountPrefix}${user.screenName}', style: Theme.of(context).textTheme.bodySmall),
                  Text(user.description),
                  /*
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(user.followersCount.toString()),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(user.friendsCount.toString()),
                      ),
                    ],
                  ),
                  */
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
