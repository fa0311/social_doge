// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSelfAccountHash() => r'dd4a69a1623c5bfe0401d564d83dc092a33270ff';

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
String _$selfAccountHash() => r'b1c197a85a90f854ec981fc17091e0314be70013';

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
String _$lastTwitterLoginHash() => r'd0127bf5922e09251a8089168a5c45be1fad89f8';

/// See also [LastTwitterLogin].
@ProviderFor(LastTwitterLogin)
final lastTwitterLoginProvider =
    NotifierProvider<LastTwitterLogin, DateTime>.internal(
  LastTwitterLogin.new,
  name: r'lastTwitterLoginProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lastTwitterLoginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LastTwitterLogin = Notifier<DateTime>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
