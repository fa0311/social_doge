import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_doge/component/part/modal.dart';
import 'package:social_doge/component/part/select_modal.dart';
import 'package:social_doge/component/part/twitter/user.dart';
import 'package:social_doge/infrastructure/database/data.dart';
import 'package:social_doge/provider/db/db.dart';
import 'package:social_doge/util/enum.dart';
import 'package:social_doge/util/twitter.dart';
import 'package:url_launcher/url_launcher.dart';

part 'page.freezed.dart';

@freezed
class CalcParam with _$CalcParam {
  const factory CalcParam({
    required List<UserTableData> left,
    required List<UserTableData> right,
    required OperatorType operator,
    required SortType sortType,
    required SortBy sortBy,
    required String search,
    required SearchType searchType,
  }) = _CalcParam;
}

enum Operator {
  intersection('∩'),
  union('∪'),
  difference('-'),
  symmetricDifference('△');

  const Operator(this.symbol);
  final String symbol;

  OperatorType toOperatorType() {
    switch (this) {
      case Operator.intersection:
        return OperatorType.intersection;
      case Operator.union:
        return OperatorType.union;
      case Operator.difference:
        return OperatorType.difference;
      case Operator.symmetricDifference:
        return OperatorType.symmetricDifference;
    }
  }
}

enum Latin {
  A('𝐴'),
  B('𝐵');

  const Latin(this.symbol);
  final String symbol;
}

enum SearchType {
  normal,
  regex,
}

@RoutePage()
class UserListPage extends HookConsumerWidget {
  const UserListPage({
    super.key,
    @QueryParam() this.leftOperand = '',
    @QueryParam() this.rightOperand = '',
    @QueryParam() this.leftTime = 0,
    @QueryParam() this.rightTime = 0,
    @QueryParam() this.operator = '',
  });
  final String leftOperand;
  final String rightOperand;
  final int leftTime;
  final int rightTime;
  final String operator;

  static List<UserTableData> calc(CalcParam param) {
    final leftSet = param.left.toSet();
    final rightSet = param.right.toSet();

    final data = switch (param.operator) {
      OperatorType.intersection => leftSet.intersection(rightSet),
      OperatorType.union => leftSet.union(rightSet),
      OperatorType.difference => leftSet.difference(rightSet),
      OperatorType.symmetricDifference => leftSet.union(rightSet).difference(leftSet.intersection(rightSet)),
    };
    final pattern = switch (param.searchType) {
      SearchType.normal => param.search,
      SearchType.regex => RegExp(param.search),
    };
    final filtered = data.where((e) => e.name.contains(pattern) || e.screenName.contains(pattern) || e.description.contains(pattern)).toList();

    final s = switch (param.sortBy) {
      SortBy.id => (UserTableData a, UserTableData b) => a.twitterId.compareTo(b.twitterId),
      SortBy.name => (UserTableData a, UserTableData b) => a.name.compareTo(b.name),
      SortBy.screenName => (UserTableData a, UserTableData b) => a.screenName.compareTo(b.screenName),
      SortBy.followerCount => (UserTableData a, UserTableData b) => a.followerCount.compareTo(b.followerCount),
      SortBy.followingCount => (UserTableData a, UserTableData b) => a.followingCount.compareTo(b.followingCount),
      SortBy.createdAt => (UserTableData a, UserTableData b) => a.createdAt.compareTo(b.createdAt),
      SortBy.ffRate => (UserTableData a, UserTableData b) => (a.followerCount / a.followingCount).compareTo(b.followerCount / b.followingCount),
    };

    final sort = switch (param.sortType) {
      SortType.asc => s,
      SortType.desc => (UserTableData a, UserTableData b) => s(b, a),
    };

    final sorted = filtered.sorted(sort);
    return sorted;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sortBy = useState(SortBy.createdAt);
    final sortType = useState(SortType.desc);
    final search = useState('');
    final searchType = useState(SearchType.normal);
    final searchController = useTextEditingController(text: search.value);

    final memo = useMemoized(
      () async {
        final (left, right) = await ref.read(
          getUserDiffProvider(
            SynchronizeMode.values.bySafeName(leftOperand),
            SynchronizeMode.values.bySafeName(rightOperand),
            DateTime.fromMillisecondsSinceEpoch(leftTime),
            DateTime.fromMillisecondsSinceEpoch(rightTime),
          ).future,
        );

        return compute(
          calc,
          CalcParam(
            left: left,
            right: right,
            operator: OperatorType.values.bySafeName(operator),
            sortType: sortType.value,
            sortBy: sortBy.value,
            search: search.value,
            searchType: searchType.value,
          ),
        );
      },
      [operator, sortBy.value, sortType.value, search.value, searchType.value],
    );

    final data = useFuture(memo, preserveState: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('差分'),
        actions: [
          IconButton(
            icon: const Icon(Icons.sort),
            onPressed: () {
              SelectModalTile.showHook(
                context,
                itemBuilder: (context) {
                  final labels = [
                    ('検索種類', SearchType.values, useState(searchType.value), searchType),
                    ('並び替え基準', SortBy.values, useState(sortBy.value), sortBy),
                    ('並び替え種類', SortType.values, useState(sortType.value), sortType),
                  ];

                  return [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: TextField(
                        controller: searchController,
                        decoration: const InputDecoration(labelText: '検索'),
                        onChanged: (text) => search.value = text,
                      ),
                    ),
                    for (final label in labels)
                      ListTile(
                        title: Text(label.$1),
                        subtitle: Text(label.$3.value.name),
                        onTap: () {
                          SelectModalTile.builder(
                            context,
                            itemCount: label.$2.length,
                            itemBuilder: (context, index) {
                              final e = label.$2.elementAt(index);
                              return ListTile(
                                title: Text(e.name),
                                selected: label.$3.value == e,
                                onTap: () {
                                  label.$3.value = e;
                                  label.$4.value = e;
                                  Navigator.pop(context);
                                },
                              );
                            },
                          );
                        },
                      ),
                  ];
                },
              );
            },
          ),
        ],
      ),
      body: switch ((data.data, data.error)) {
        (final List<UserTableData> data, _) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final user = data[index];
              return ListTile(
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: CachedNetworkImage(
                    imageUrl: ProfileImageUrlHttps(user.profileImageUrl).original,
                    fit: BoxFit.fill,
                    imageBuilder: (context, imageProvider) => CircleAvatar(
                      backgroundImage: imageProvider,
                    ),
                  ),
                ),
                title: Text(user.name, maxLines: 1, overflow: TextOverflow.ellipsis),
                subtitle: Text(user.description, maxLines: 3, overflow: TextOverflow.ellipsis),
                trailing: Text(user.screenName),
                onTap: () async {
                  final url = Uri.https('twitter.com', 'intent/user', {'user_id': user.twitterId});
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                onLongPress: () async {
                  await showModalBottomSheetStatelessWidget<void>(
                    context: context,
                    builder: () {
                      return UserProfile(user: user);
                    },
                  );
                },
              );
            },
          ),
        (null, null) => const Center(child: CircularProgressIndicator()),
        (null, final error) => Center(child: Text(error.toString())),
      },
    );
  }
}
