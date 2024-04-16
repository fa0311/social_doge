import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/provider/db/db.dart';

@RoutePage()
class ResultPage extends HookConsumerWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(getFollowerTimeProvider);
    return Scaffold(
      body: time.when(
        data: (time) {
          if (time.length < 2) {
            return Center(child: Text(AppLocalizations.of(context)!.noData));
          }
          return ListView.builder(
            itemBuilder: (context, i) {
              final date = time[time.length - i - 1];
              return ListTile(
                title: Text(DateFormat(AppLocalizations.of(context)!.dateFormat1).format(date)),
                onTap: () {
                  context.router.push(UnfollowRoute(count: 0));
                },
              );
            },
            itemCount: time.length - 1,
          );
        },
        error: (error, stackTrace) => Column(
          children: [
            for (final e in [error.toString(), stackTrace.toString()]) Text(e),
          ],
        ),
        loading: () => const Loading(),
      ),
    );
  }
}
