// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_filters_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedFiltersHash() => r'1c8e5b394da3c137fd2242268a632908df591c08';

/// 전체 Filter 리스트 중 선택된 Filter만을 반환하는 Provider
///
/// Copied from [selectedFilters].
@ProviderFor(selectedFilters)
final selectedFiltersProvider =
    AutoDisposeProvider<List<FilterListItemModel>>.internal(
  selectedFilters,
  name: r'selectedFiltersProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedFiltersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SelectedFiltersRef = AutoDisposeProviderRef<List<FilterListItemModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
