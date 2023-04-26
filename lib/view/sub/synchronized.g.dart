// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronized.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDatabaseHash() => r'caaae32be13c285edddb952b28d777a7d114b51e';

/// See also [getDatabase].
@ProviderFor(getDatabase)
final getDatabaseProvider = AutoDisposeFutureProvider<Database>.internal(
  getDatabase,
  name: r'getDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetDatabaseRef = AutoDisposeFutureProviderRef<Database>;
String _$twitterClientHash() => r'a7f6c030ff9595fb8b0b9a1174f921c0fc9b90eb';

/// See also [twitterClient].
@ProviderFor(twitterClient)
final twitterClientProvider =
    AutoDisposeStreamProvider<Map<String, UserStatusJoin>>.internal(
  twitterClient,
  name: r'twitterClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$twitterClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TwitterClientRef
    = AutoDisposeStreamProviderRef<Map<String, UserStatusJoin>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
