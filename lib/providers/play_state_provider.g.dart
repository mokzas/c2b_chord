// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$playStateHash() => r'8d9d0b9872c7dc69031d4071235b7d11c78d44e3';

/// 연습 중 메트로놈 재생, 악보(chord) 넘기기 등에 필요한 상태 정보 provider.
///
/// Copied from [PlayState].
@ProviderFor(PlayState)
final playStateProvider =
    AutoDisposeNotifierProvider<PlayState, PlayStateModel>.internal(
  PlayState.new,
  name: r'playStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$playStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayState = AutoDisposeNotifier<PlayStateModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
