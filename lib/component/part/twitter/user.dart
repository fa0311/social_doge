import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/util/twitter.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfile extends HookConsumerWidget {
  const UserProfile({super.key, required this.user, required this.suffixButton});
  final UserTableData user;
  final Widget suffixButton;
  static const twitterAccountPrefix = '@';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.3333,
          child: (user.profileBannerUrl == null)
              ? Container(
                  color: Colors.grey,
                )
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
                width: 100,
                height: 100,
                child: CachedNetworkImage(
                  imageUrl: ProfileImageUrlHttps(user.profileImageUrl).original,
                  fit: BoxFit.fill,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                  ),
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
                        child: suffixButton,
                      ),
                    ],
                  ),
                  Text(user.name, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                  Text('$twitterAccountPrefix${user.screenName}', style: Theme.of(context).textTheme.bodySmall),
                  Text(user.description),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
