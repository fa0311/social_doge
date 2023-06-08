// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronized.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDatabaseHash() => r'b11175160392835acda604f9db3fae4b453b88cb';

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
String _$twitterClientHash() => r'758ed374e40ad08b1650cb59a0b5d0ae9d81fbd8';

/// See also [twitterClient].
@ProviderFor(twitterClient)
final twitterClientProvider =
    AutoDisposeStreamProvider<TwitterClientResponse>.internal(
  twitterClient,
  name: r'twitterClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$twitterClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TwitterClientRef = AutoDisposeStreamProviderRef<TwitterClientResponse>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
