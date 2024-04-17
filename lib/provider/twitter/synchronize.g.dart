// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synchronize.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$runSynchronizeHash() => r'08dbc22e6cabfa343959bb144901cc28eea9ad28';

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

/// See also [runSynchronize].
@ProviderFor(runSynchronize)
const runSynchronizeProvider = RunSynchronizeFamily();

/// See also [runSynchronize].
class RunSynchronizeFamily extends Family<AsyncValue<TwitterClientResponse>> {
  /// See also [runSynchronize].
  const RunSynchronizeFamily();

  /// See also [runSynchronize].
  RunSynchronizeProvider call(
    SynchronizeMode mode,
  ) {
    return RunSynchronizeProvider(
      mode,
    );
  }

  @override
  RunSynchronizeProvider getProviderOverride(
    covariant RunSynchronizeProvider provider,
  ) {
    return call(
      provider.mode,
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
  String? get name => r'runSynchronizeProvider';
}

/// See also [runSynchronize].
class RunSynchronizeProvider
    extends AutoDisposeStreamProvider<TwitterClientResponse> {
  /// See also [runSynchronize].
  RunSynchronizeProvider(
    SynchronizeMode mode,
  ) : this._internal(
          (ref) => runSynchronize(
            ref as RunSynchronizeRef,
            mode,
          ),
          from: runSynchronizeProvider,
          name: r'runSynchronizeProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$runSynchronizeHash,
          dependencies: RunSynchronizeFamily._dependencies,
          allTransitiveDependencies:
              RunSynchronizeFamily._allTransitiveDependencies,
          mode: mode,
        );

  RunSynchronizeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.mode,
  }) : super.internal();

  final SynchronizeMode mode;

  @override
  Override overrideWith(
    Stream<TwitterClientResponse> Function(RunSynchronizeRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RunSynchronizeProvider._internal(
        (ref) => create(ref as RunSynchronizeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<TwitterClientResponse> createElement() {
    return _RunSynchronizeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RunSynchronizeProvider && other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RunSynchronizeRef on AutoDisposeStreamProviderRef<TwitterClientResponse> {
  /// The parameter `mode` of this provider.
  SynchronizeMode get mode;
}

class _RunSynchronizeProviderElement
    extends AutoDisposeStreamProviderElement<TwitterClientResponse>
    with RunSynchronizeRef {
  _RunSynchronizeProviderElement(super.provider);

  @override
  SynchronizeMode get mode => (origin as RunSynchronizeProvider).mode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
