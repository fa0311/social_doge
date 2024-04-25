// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guard.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lastGuardHash() => r'19cf6bea46fa2c734efc96025aa47fdd7a7f5082';

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
  late final GuardType type;

  DateTime build(
    GuardType type,
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
    GuardType type,
  ) {
    return LastGuardProvider(
      type,
    );
  }

  @override
  LastGuardProvider getProviderOverride(
    covariant LastGuardProvider provider,
  ) {
    return call(
      provider.type,
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
    GuardType type,
  ) : this._internal(
          () => LastGuard()..type = type,
          from: lastGuardProvider,
          name: r'lastGuardProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lastGuardHash,
          dependencies: LastGuardFamily._dependencies,
          allTransitiveDependencies: LastGuardFamily._allTransitiveDependencies,
          type: type,
        );

  LastGuardProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.type,
  }) : super.internal();

  final GuardType type;

  @override
  DateTime runNotifierBuild(
    covariant LastGuard notifier,
  ) {
    return notifier.build(
      type,
    );
  }

  @override
  Override overrideWith(LastGuard Function() create) {
    return ProviderOverride(
      origin: this,
      override: LastGuardProvider._internal(
        () => create()..type = type,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        type: type,
      ),
    );
  }

  @override
  NotifierProviderElement<LastGuard, DateTime> createElement() {
    return _LastGuardProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LastGuardProvider && other.type == type;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, type.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LastGuardRef on NotifierProviderRef<DateTime> {
  /// The parameter `type` of this provider.
  GuardType get type;
}

class _LastGuardProviderElement
    extends NotifierProviderElement<LastGuard, DateTime> with LastGuardRef {
  _LastGuardProviderElement(super.provider);

  @override
  GuardType get type => (origin as LastGuardProvider).type;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
