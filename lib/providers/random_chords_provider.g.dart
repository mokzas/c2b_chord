// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_chords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomChordsHash() => r'b6152b6d8dabf80ebee5f33d25b9185dee050f70';

/// 선택된 코드 중 랜덤으로 chord를 뽑아 반환하는 Provider
///
/// 화면에 표시할 chord 수만큼 뽑아서 반환
///
/// Copied from [RandomChords].
@ProviderFor(RandomChords)
final randomChordsProvider =
    AutoDisposeNotifierProvider<RandomChords, List<String>>.internal(
  RandomChords.new,
  name: r'randomChordsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$randomChordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RandomChords = AutoDisposeNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
