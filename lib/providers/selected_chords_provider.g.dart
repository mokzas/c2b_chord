// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_chords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedChordsHash() => r'b8c64e9e586187f987f778e3d822b99181887ddd';

/// 전체 Chord 중 선택된 Chord만을 반환하는 Provider
///
/// Copied from [selectedChords].
@ProviderFor(selectedChords)
final selectedChordsProvider = AutoDisposeProvider<List<ChordModel>>.internal(
  selectedChords,
  name: r'selectedChordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedChordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedChordsRef = AutoDisposeProviderRef<List<ChordModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
