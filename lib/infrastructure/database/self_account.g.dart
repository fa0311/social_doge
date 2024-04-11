// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'self_account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSelfAccountHash() => r'cf2ec7baa123278c244e9e3900f4114de6dcac0f';

/// See also [getSelfAccount].
@ProviderFor(getSelfAccount)
final getSelfAccountProvider = FutureProvider<User>.internal(
  getSelfAccount,
  name: r'getSelfAccountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSelfAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSelfAccountRef = FutureProviderRef<User>;
String _$selfAccountHash() => r'38fd110af1398ec107739413b404c13749ea8c62';

/// See also [SelfAccount].
@ProviderFor(SelfAccount)
final selfAccountProvider =
    AsyncNotifierProvider<SelfAccount, String?>.internal(
  SelfAccount.new,
  name: r'selfAccountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$selfAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelfAccount = AsyncNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
