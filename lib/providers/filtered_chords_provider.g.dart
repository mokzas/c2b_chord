// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_chords_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$filteredChordsHash() => r'6ced9014f037ffa3064c60cf299d5d0941bf796e';

/// 유저가 선택한 필터 조건에 맞는 코드들의 리스트를 반환하는 Provider
///
/// Copied from [filteredChords].
@ProviderFor(filteredChords)
final filteredChordsProvider =
    AutoDisposeProvider<List<ChordListItemModel>>.internal(
  filteredChords,
  name: r'filteredChordsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$filteredChordsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FilteredChordsRef = AutoDisposeProviderRef<List<ChordListItemModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
