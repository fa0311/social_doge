import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/app/router.dart';
import 'package:social_doge/component/part/confirm.dart';
import 'package:social_doge/component/part/label.dart';
import 'package:social_doge/component/part/loading.dart';
import 'package:social_doge/provider/twitter/synchronize.dart';

@RoutePage()
class SynchronizePage extends HookConsumerWidget {
  const SynchronizePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(getFollowersProvider);
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).padding.left + 40,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.synchronize)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: client.when(
            data: (messages) {
              return Column(
                children: [
                  Text('${messages.progress}/${messages.length}'),
                  ClipRRect(
                    child: LinearProgressIndicator(
                      value: messages.progress / messages.length,
                    ),
                  ),
                  if (!messages.finish)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: AlertLabel(child: Text(AppLocalizations.of(context)!.syncAlert)),
                    ),
                  if (messages.finish)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SuccessLabel(child: Text(AppLocalizations.of(context)!.syncSuccess)),
                    ),
                  Expanded(child: Container()),
                  if (messages.wait != null) ...[
                    Text(AppLocalizations.of(context)!.apiLimit),
                    Text(AppLocalizations.of(context)!.apiLimitDetails(messages.wait!)),
                  ],
                  if (!messages.finish)
                    ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                      onPressed: () {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) => ConfirmDialog(
                            pop: false,
                            content: Text(AppLocalizations.of(context)!.syncCancelConfirm),
                            onPressed: () async {
                              await context.router.push(const SocialDogeRoute());
                            },
                          ),
                        );
                      },
                      child: Text(AppLocalizations.of(context)!.cancel),
                    ),
                  if (messages.finish)
                    ElevatedButton(
                      onPressed: () async {
                        await context.router.push(const SocialDogeRoute());
                      },
                      child: Text(AppLocalizations.of(context)!.close),
                    ),
                ],
              );
            },
            error: (error, stackTrace) => Column(
              children: [
                for (final e in [error.toString(), stackTrace.toString()]) Text(e),
              ],
            ),
            loading: () => const Loading(),
          ),
        ),
      ),
    );
  }
}

// class SynchronizeRemove extends HookConsumerWidget {
//   const SynchronizeRemove({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final remover = ref.watch(removeLastSynchronizedProvider);

//     return Scaffold(
//       body: remover.when(
//         data: (_) {
//           WidgetsBinding.instance.addPostFrameCallback((_) async {
            
//             await context.router.push(const SocialDogeRoute());
            
//             await Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute<void>(builder: (context) => const SocialDogeHome()), (_) => false);
//           });
//           return SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading()));
//         },
//         error: (error, stackTrace) => Column(
//           children: [
//             for (final e in [error.toString(), stackTrace.toString()]) Text(e),
//           ],
//         ),
//         loading: () => SizedBox(height: MediaQuery.of(context).size.height, child: const Center(child: Loading())),
//       ),
//     );
//   }
// }
