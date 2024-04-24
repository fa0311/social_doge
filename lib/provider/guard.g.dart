// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guard.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lastGuardHash() => r'dbf7358a9516b7a1bdf6635f86426ccfaf8684b2';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$LastGuard extends BuildlessNotifier<DateTime> {
  late final int hash;

  DateTime build(
    int hash,
  );
}

/// See also [LastGuard].
@ProviderFor(LastGuard)
const lastGuardProvider = LastGuardFamily();

/// See also [LastGuard].
class LastGuardFamily extends Family<DateTime> {
  /// See also [LastGuard].
  const LastGuardFamily();

  /// See also [LastGuard].
  LastGuardProvider call(
    int hash,
  ) {
    return LastGuardProvider(
      hash,
    );
  }

  @override
  LastGuardProvider getProviderOverride(
    covariant LastGuardProvider provider,
  ) {
    return call(
      provider.hash,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'lastGuardProvider';
}

/// See also [LastGuard].
class LastGuardProvider extends NotifierProviderImpl<LastGuard, DateTime> {
  /// See also [LastGuard].
  LastGuardProvider(
    int hash,
  ) : this._internal(
          () => LastGuard()..hash = hash,
          from: lastGuardProvider,
          name: r'lastGuardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastGuardHash,
          dependencies: LastGuardFamily._dependencies,
          allTransitiveDependencies: LastGuardFamily._allTransitiveDependencies,
          hash: hash,
        );

  LastGuardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.hash,
  }) : super.internal();

  final int hash;

  @override
  DateTime runNotifierBuild(
    covariant LastGuard notifier,
  ) {
    return notifier.build(
      hash,
    );
  }

  @override
  Override overrideWith(LastGuard Function() create) {
    return ProviderOverride(
      origin: this,
      override: LastGuardProvider._internal(
        () => create()..hash = hash,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        hash: hash,
      ),
    );
  }

  @override
  NotifierProviderElement<LastGuard, DateTime> createElement() {
    return _LastGuardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastGuardProvider && other.hash == hash;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, hash.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastGuardRef on NotifierProviderRef<DateTime> {
  /// The parameter `hash` of this provider.
  int get hash;
}

class _LastGuardProviderElement
    extends NotifierProviderElement<LastGuard, DateTime> with LastGuardRef {
  _LastGuardProviderElement(super.provider);

  @override
  int get hash => (origin as LastGuardProvider).hash;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
