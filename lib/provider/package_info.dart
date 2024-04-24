import 'package:dio/dio.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:social_doge/constant/config.dart';
import 'package:social_doge/util/logger.dart';

part 'package_info.g.dart';

@Riverpod(keepAlive: true)
Future<PackageInfo> packageVersion(PackageVersionRef ref) => PackageInfo.fromPlatform();

@Riverpod(keepAlive: true)
Future<String> latestAppVersion(LatestAppVersionRef ref) async {
  final dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/vnd.github.v3+json',
        'User-Agent': 'social-doge',
      },
    ),
  );
  dio.interceptors.add(dioLogger);
  final response = await dio.get<dynamic>(Config.releaseApi.toString());
  final version = ((response.data as List<dynamic>).first as Map<String, dynamic>)['tag_name'] as String;
  assert(version.startsWith('v'));
  return version.substring(1);
}
